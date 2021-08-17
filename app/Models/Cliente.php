<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = 'Cliente';

    protected $fillable = ['Nome', 'Telefone1', 'Telefone2', 'Email'];

    public $timestamps = false;
}
