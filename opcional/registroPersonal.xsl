<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Registro Personal</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"/>
            </head>
            <body>
                <div class="container mt-5">
                    <h1 class="mb-4">Gestión de Personal y Departamentos</h1>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="empleados-tab" data-bs-toggle="tab" href="#empleados" role="tab">Empleados</a></li>
                        <li class="nav-item"><a class="nav-link" id="consultores-tab" data-bs-toggle="tab" href="#consultores" role="tab">Consultores</a></li>
                        <li class="nav-item"><a class="nav-link" id="departamentos-tab" data-bs-toggle="tab" href="#departamentos" role="tab">Departamentos</a></li>
                    </ul>

                    <div class="tab-content mt-3">
                        <div class="tab-pane fade show active" id="empleados" role="tabpanel">
                            <table class="table table-bordered">
                                <thead><tr><th>Código</th><th>Nombre</th><th>Sexo</th><th>Contacto</th><th>Departamento</th></tr></thead>
                                <tbody>
                                    <xsl:for-each select="//empleado">
                                        <tr>
                                            <td><xsl:value-of select="@codigo"/></td>
                                            <td><xsl:value-of select="nombre"/></td>
                                            <td><xsl:value-of select="sexo"/></td>
                                            <td><xsl:value-of select="contacto/*"/></td>
                                            <td>
                                                <a xlink:href="#{@codigo}">
                                                    <xsl:value-of select="departamento/@codigo"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane fade" id="consultores" role="tabpanel">
                            <table class="table table-bordered">
                                <thead><tr><th>Código</th><th>Nombre</th><th>Sexo</th><th>Contacto</th><th>Departamento</th><th>Empresa</th></tr></thead>
                                <tbody>
                                    <xsl:for-each select="//consultor">
                                        <tr>
                                            <td><xsl:value-of select="@codigo"/></td>
                                            <td><xsl:value-of select="nombre"/></td>
                                            <td><xsl:value-of select="sexo"/></td>
                                            <td><xsl:value-of select="contacto/*"/></td>
                                            <td><xsl:value-of select="departamento/@codigo"/></td>
                                            <td><xsl:value-of select="empresaExterna"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>

<!-- Departamentos -->
<!--
<div class="tab-pane fade" id="departamentos" role="tabpanel">
    <ul>
        <xsl:for-each select="//departamento[nombre]">
            <li id="{@codigo}">
                <strong><xsl:value-of select="nombre"/></strong>
                - <xsl:value-of select="director"/> (<xsl:value-of select="direccion/ciudad"/>)
                <br/>
                <xsl:text>Empleados: </xsl:text><xsl:value-of select="empleados"/>
            </li>
        </xsl:for-each>
    </ul>
</div>
-->
<!-- Departamentos -->
<div class="tab-pane fade" id="departamentos" role="tabpanel">
    <ul>
        <xsl:for-each select="//departamento[nombre]">
            <li id="{@codigo}">
                <strong><xsl:value-of select="nombre"/></strong>
                - <xsl:value-of select="director"/> (<xsl:value-of select="direccion/ciudad"/>)
                <br/>
                <xsl:text>Empleados: </xsl:text>
                <xsl:for-each select="//empleado[departamento/@codigo = current()/@codigo]">
                    <xsl:value-of select="nombre"/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </ul>
</div>


                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
