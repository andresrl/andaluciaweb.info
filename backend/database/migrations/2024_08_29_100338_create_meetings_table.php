<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('meetings', function (Blueprint $table) {
            $table->id();
            $table->string('company_name')->nullable();
            $table->string('company_tradename')->nullable();
            $table->string('company_username')->nullable();
            $table->string('company_email')->nullable();
            $table->string('professional_fullname')->nullable();
            $table->string('professional_company')->nullable();
            $table->string('professional_email')->nullable();
            $table->string('professional_sector')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('meetings');
    }
};
