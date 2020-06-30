package model;
public class Cliente {
    private int id;
    private String email;
    private String senha;
    private String nome;
    private TCliente tipo;
    private boolean ativo;
    
    public int getId() {
        return this.id;
    }
    
    public void setId(int value) {
        this.id = value;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String value) {
        this.email = value;
    }
    
    public String getSenha() {
        return this.senha;
    }
    
    public void setSenha(String value) {
        this.senha = value;
    }

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public TCliente getTipo() {
		return tipo;
	}

	public void setTipo(TCliente admin) {
		this.tipo = admin;
	}

	public boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
}
