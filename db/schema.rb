# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120724120208) do

  create_table "data_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participantes", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "projeto"
    t.string   "foto_url"
    t.text     "descricao"
    t.string   "lattes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "login"
    t.string   "password"
    t.string   "salt"
    t.string   "permission"
  end

  create_table "pesquisas", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.text     "participantes"
    t.text     "financiadores"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "publicacaos", :force => true do |t|
    t.text     "participantes"
    t.text     "titulo"
    t.integer  "ano"
    t.string   "suporte"
    t.integer  "volume"
    t.integer  "pag_ini"
    t.integer  "pag_final"
    t.string   "arquivo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "tipo"
    t.text     "abstract"
  end

  create_table "status_sheets", :force => true do |t|
    t.integer  "participante_id"
    t.date     "data_ini"
    t.date     "data_final"
    t.text     "status"
    t.integer  "projeto_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
