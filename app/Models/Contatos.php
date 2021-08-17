<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contatos extends Model
{
    use HasFactory;

    protected $table = 'contatos';

    protected $fillable = ['pessoa_id', 'tipo', 'contato'];

    public $timestamps = false;
}
