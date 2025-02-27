<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Maatwebsite\Excel\Facades\Excel;

use App\Imports\GoliDataImport; // Necesitarás crear esta clase de importación

use App\Models\Meeting;

class MeetingController extends Controller
{
    public function getGoliData() {

        $goliDataFile = public_path('goli.xlsx');
        $data = Excel::toArray(new GoliDataImport, $goliDataFile);

        // Asumimos que los datos relevantes están en la primera hoja (índice 0)
        $sheet = $data[0];

        // Obtenemos las claves (primera fila)
        $keys = $sheet[0];

        $result = [];
        for ($i = 1; $i < count($sheet); $i++) {
            $row = $sheet[$i];
            $item = [];
            for ($j = 0; $j < count($keys); $j++) {
                $key = $keys[$j] === null ? '__EMPTY' : $keys[$j];
                if ($row[$j] !== null) {
                    $item[$key] = $row[$j];
                }
            }
            if (!empty($item)) {
                $result[] = $item;
            }
        }

        return response()->json($result);
    }

    public function getGoli2Data() {

        $goliDataFile = public_path('goli-2.xlsx');
        $data = Excel::toArray(new GoliDataImport, $goliDataFile);

        // Asumimos que los datos relevantes están en la primera hoja (índice 0)
        $sheet = $data[0];

        // Obtenemos las claves (segunda fila, índice 1)
        $keys = $sheet[1];

        // Obtenemos los valores (tercera fila, índice 2)
        $values = $sheet[2];

        // Combinamos las claves y los valores en un array asociativo
        $result = array_combine($keys, $values);

        // Eliminamos las claves nulas si existen
        $result = array_filter($result, function($key) {
            return $key !== null;
        }, ARRAY_FILTER_USE_KEY);

        return response()->json([$result]);
    }

    public function storeMeeting(Request $request) {
        //Save Meeting into database
        $meeting = new Meeting();
        $meeting->fill($request->all());
        $meeting->save();

        return response()->json(['status' => 'success', 'message' => 'Meeting saved successfully']);
    }

    public function getMeetings() {
        $meetings = Meeting::all();
        return response()->json($meetings);
    }

    public function getGroupCompanyMeetings() {
        $meetings = Meeting::select('company_tradename', \DB::raw('COUNT(*) as meeting_count'))
                           ->groupBy('company_tradename')
                           ->orderBy('meeting_count', 'DESC')
                           ->get();
        return response()->json($meetings);
    }

    // public function storeMeetingJson(Request $request)
    // {
    //     // Acceder a los datos enviados en la solicitud POST
    //     $data = $request->all();

    //     // Aquí puedes procesar $data como necesites
    //     // Por ejemplo, almacenar la información en un archivo JSON como antes

    //     $filePath = public_path('meetings.json');

    //     if (!file_exists($filePath)) {
    //         // Si el archivo no existe, crea un nuevo array de reuniones
    //         $meetings = [];
    //     } else {
    //         // Si el archivo existe, lee su contenido
    //         $meetingsContent = file_get_contents($filePath);
    //         $meetings = json_decode($meetingsContent, true) ?: [];
    //     }

    //     // Añade los nuevos datos al array de reuniones
    //     $meetings[] = $data;

    //     // Guarda el array actualizado de nuevo en el archivo
    //     file_put_contents($filePath, json_encode($meetings, JSON_PRETTY_PRINT));

    //     // Devuelve una respuesta
    //     return response()->json(['status' => 'success', 'message' => 'Datos guardados correctamente']);
    // }
}
