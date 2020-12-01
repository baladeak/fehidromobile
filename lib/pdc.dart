class Pdc {
  final int id;
  final String titulo;

  Pdc(this.id, this.titulo);

  @override
  String toString() {
    return 'Pdc #${this.id} - ${this.titulo}';
  }
}