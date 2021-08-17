<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Racas extends Model
{
    use HasFactory;

    protected $table    = 'racas';

    protected $fillable = ['id', 'especie_id', 'nome'];

    public $timestamps   = false;

}
