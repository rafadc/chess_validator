require 'pry'
require_relative 'pieces'

class ChessBoard
  def initialize
    @board = {
      "a8" => "bR", "b8" => "bN", "c8" => "bB" , "d8" => "bQ", "e8" => "bK", "f8" => "bB", "g8" => "bN", "h8" => "bR",
      "a7" => "bP", "b7" => "bP", "c7" => "bP" , "d7" => "bP", "e7" => "bP", "f7" => "bP", "g7" => "bP", "h7" => "bP",
      "a6" => "--", "b6" => "--", "c6" => "--" , "d6" => "--", "e6" => "--", "f6" => "--", "g6" => "--", "h6" => "--",
      "a5" => "--", "b5" => "--", "c5" => "--" , "d5" => "--", "e5" => "--", "f5" => "--", "g5" => "--", "h5" => "--",
      "a4" => "--", "b4" => "--", "c4" => "--" , "d4" => "--", "e4" => "--", "f4" => "--", "g4" => "--", "h4" => "--",
      "a3" => "--", "b3" => "--", "c3" => "--" , "d3" => "--", "e3" => "--", "f3" => "--", "g3" => "--", "h3" => "--",
      "a2" => "wP", "b2" => "wP", "c2" => "wP" , "d2" => "wP", "e2" => "wP", "f2" => "wP", "g2" => "wP", "h2" => "wP",
      "a1" => "wR", "b1" => "wN", "c1" => "wB" , "d1" => "wQ", "e1" => "wK", "f1" => "wB", "g1" => "wN", "h1" => "wR"
            }
  end

  def check_move(move)
    origin = move.slice(0,2)
    destination = move.slice(3,2)
    Piece.new(@board, origin, destination).can_move? && destination_free(destination)? "LEGAL" : "ILLEGAL"
  end

  def load_board(file)
    File.open(file, 'r') do |file|
      row = 8
      file.each do |line|
        parse_board_line(line, row)
        row -= 1
      end
    end
  end

  def print_board
    @board.each do |square, piece|
      print piece + " "
      puts if square.slice(0,1)=="h"
    end
  end

  private
  def destination_free(destination)
    @board[destination] == "--"
  end

  def parse_board_line(line, row)
    col = 1
    row_pieces = line.split(" ")
    row_pieces.each do |piece|
      @board[("a".ord + col - 1).chr + row.to_s] = piece
      col += 1
    end
  end

end
