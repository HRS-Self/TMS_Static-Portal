export class BackendApiError extends Error {
  public readonly status: number;
  public readonly backend: string;

  public constructor(message: string, status: number, backend: string) {
    super(message);
    this.name = "BackendApiError";
    this.status = status;
    this.backend = backend;
  }
}
