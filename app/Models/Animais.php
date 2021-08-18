<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Animais extends Model
{
    protected $table    = 'animais';

    protected $fillable = [
        'pessoa_id',
        'especie_id',
        'raca_id',
        'nome',
        'nascimento'
    ];

    public $timestamps   = false;
}
