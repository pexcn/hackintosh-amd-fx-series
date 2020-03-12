/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200214 (32-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of DSDT.aml, Thu Mar 12 15:16:22 2020
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00006D50 (27984)
 *     Revision         0x02
 *     Checksum         0x7B
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("", "DSDT", 2, "ALASKA", "A M I", 0x00000000)
{
    Name (SP1O, 0x2E)
    Name (IO1B, 0x0290)
    Name (IO1L, 0x20)
    Name (IO2B, 0x0230)
    Name (IO2L, 0x20)
    Name (IO3B, 0x0F40)
    Name (IO3L, 0x20)
    Name (SMBB, 0x0B20)
    Name (SMBL, 0x20)
    Name (SMB0, 0x0B00)
    Name (SMBM, 0x10)
    Name (PMBS, 0x0800)
    Name (PMLN, 0xA0)
    Name (SMIO, 0xB2)
    Name (GPBS, Zero)
    Name (GPLN, Zero)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (SPIB, 0xFEC10000)
    Name (SPIL, 0x1000)
    Name (HPTB, 0xFED00000)
    Name (HPTL, 0x1000)
    Name (GIOB, 0xFED80100)
    Name (IOMB, 0xFED80D00)
    Name (SMIB, 0xFED80200)
    Name (PEBS, 0xE0000000)
    Name (PEBL, 0x10000000)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (AMWV, 0x09)
    Name (SMIT, 0xB2)
    Name (OFST, 0x35)
    Name (TRST, 0x02)
    Name (TPMF, Zero)
    Name (TCMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (SMIP, 0xB2)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            DBG8 = 0xAA
            \_SB.IRQC ()
        }
        Else
        {
            DBG8 = 0xAC
        }

        PICM = Arg0
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If ((OSVR != Ones))
        {
            Return (OSVR) /* \OSVR */
        }

        If ((PICM == Zero))
        {
            DBG8 = 0xAC
        }

        OSVR = One
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Linux"))
            {
                OSVR = 0x03
            }

            If (_OSI ("Windows 2001"))
            {
                OSVR = 0x04
            }

            If (_OSI ("Windows 2001.1"))
            {
                OSVR = 0x05
            }

            If (_OSI ("FreeBSD"))
            {
                OSVR = 0x06
            }

            If (_OSI ("HP-UX"))
            {
                OSVR = 0x07
            }

            If (_OSI ("OpenVMS"))
            {
                OSVR = 0x08
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                OSVR = 0x09
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                OSVR = 0x0A
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                OSVR = 0x0B
            }

            If (_OSI ("Windows 2006"))
            {
                OSVR = 0x0C
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                OSVR = 0x0D
            }

            If (_OSI ("Windows 2009"))
            {
                OSVR = 0x0E
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                OSVR = Zero
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                OSVR = One
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                OSVR = 0x02
            }

            If (MCTH (_OS, "Linux"))
            {
                OSVR = 0x03
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                OSVR = 0x06
            }

            If (MCTH (_OS, "HP-UX"))
            {
                OSVR = 0x07
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                OSVR = 0x08
            }
        }

        Return (OSVR) /* \OSVR */
    }

    Method (MCTH, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) < SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = (SizeOf (Arg0) + One)
        Name (BUF0, Buffer (Local0){})
        Name (BUF1, Buffer (Local0){})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0]
                )))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        Local0 = (SS1 << One)
        Local0 |= (SS2 << 0x02)
        Local0 |= (SS3 << 0x03)
        Local0 |= (SS4 << 0x04)
        If (((One << Arg1) & Local0))
        {
            PRWP [One] = Arg1
        }
        Else
        {
            Local0 >>= One
            If (((OSFL () == One) || (OSFL () == 0x02)))
            {
                FindSetLeftBit (Local0, PRWP [One])
            }
            Else
            {
                FindSetRightBit (Local0, PRWP [One])
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, Zero)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0x0001)
    Name (TOPM, 0x00000000)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    Name (OSTY, Ones)
    OperationRegion (ACMS, SystemIO, 0x72, 0x10)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ICMS,   8, 
        DCMS,   8, 
        Offset (0x0E), 
        P80,    8
    }

    IndexField (ICMS, DCMS, ByteAcc, NoLock, Preserve)
    {
        Offset (0x08), 
        BS_A,   32
    }

    OperationRegion (CFGS, SystemMemory, BS_A, 0x0100)
    Field (CFGS, AnyAcc, NoLock, Preserve)
    {
        Offset (0x0C), 
        PCIE,   32, 
        Offset (0x7F), 
            ,   5, 
        GGN2,   1, 
        Offset (0x87), 
        GECE,   1, 
        IR_E,   1, 
        Offset (0x93), 
            ,   5, 
        OSCF,   1, 
        Offset (0x9E), 
        PRS0,   1, 
        DET0,   1, 
        Offset (0xA2), 
        PRS1,   1, 
        DET1,   1, 
        Offset (0xA6), 
        PRS2,   1, 
        DET2,   1, 
        Offset (0xAA), 
        PRS3,   1, 
        DET3,   1, 
        Offset (0xB2), 
            ,   6, 
        ABPS,   1, 
            ,   3, 
        GPPS,   1
    }

    OperationRegion (CMPT, SystemIO, 0x0C50, 0x03)
    Field (CMPT, ByteAcc, NoLock, Preserve)
    {
        CMID,   8, 
            ,   6, 
        GPCT,   2, 
        GP0I,   1, 
        GP1I,   1, 
        GP2I,   1, 
        GP3I,   1, 
        GP4I,   1, 
        GP5I,   1, 
        GP6I,   1, 
        GP7I,   1
    }

    OperationRegion (PCFG, SystemMemory, PCIE, 0x02000000)
    Field (PCFG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x20078), 
        Offset (0x2007A), 
        PMSA,   1, 
        Offset (0x28078), 
        Offset (0x2807A), 
        PMSB,   1, 
        Offset (0x48078), 
        Offset (0x4807A), 
        PMSC,   1, 
        Offset (0x8800A), 
        STCL,   16, 
        Offset (0xA0004), 
        SMIE,   1, 
        SMME,   1, 
        Offset (0xA0008), 
        RVID,   8, 
        Offset (0xA0014), 
        SMB1,   32, 
        Offset (0xA0082), 
            ,   2, 
        G31O,   1, 
        Offset (0xA00E1), 
            ,   6, 
        ACIR,   1, 
        Offset (0xA4004), 
        PCMD,   2, 
        Offset (0xA807A), 
        PMS0,   1, 
        Offset (0xA8088), 
        TLS0,   4, 
        Offset (0xA907A), 
        PMS1,   1, 
        Offset (0xA9088), 
        TLS1,   4, 
        Offset (0xAA07A), 
        PMS2,   1, 
        Offset (0xAA088), 
        TLS2,   4, 
        Offset (0xAB07A), 
        PMS3,   1, 
        Offset (0xAB088), 
        TLS3,   4
    }

    OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        INPM,   8, 
        DAPM,   8
    }

    IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
    {
        Offset (0x24), 
        MMSO,   32, 
        Offset (0x60), 
        P1EB,   16
    }

    OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
    Field (ERMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x132), 
            ,   7, 
        GP51,   1, 
        Offset (0x136), 
            ,   7, 
        GP55,   1, 
        Offset (0x13A), 
            ,   7, 
        GP59,   1, 
        Offset (0x13D), 
        GP62,   8, 
        Offset (0x13F), 
            ,   7, 
        GP64,   1, 
        Offset (0x16A), 
            ,   7, 
        GE11,   1, 
            ,   7, 
        GE12,   1, 
        Offset (0x16E), 
            ,   7, 
        BATS,   1, 
        Offset (0x287), 
            ,   1, 
        CLPS,   1, 
        Offset (0x298), 
            ,   7, 
        G15A,   1, 
        Offset (0x2AF), 
            ,   2, 
        SLPS,   2, 
        Offset (0x376), 
        EPNM,   1, 
        DPPF,   1, 
        Offset (0x3BA), 
            ,   6, 
        PWDE,   1, 
        Offset (0x3BD), 
            ,   5, 
        ALLS,   1, 
        Offset (0x3EF), 
        PHYD,   1, 
            ,   1, 
            ,   1, 
        US5R,   1, 
        Offset (0x3F5), 
        GECD,   1
    }

    OperationRegion (ABIO, SystemIO, 0x0CD8, 0x08)
    Field (ABIO, DWordAcc, NoLock, Preserve)
    {
        INAB,   32, 
        DAAB,   32
    }

    Method (RDAB, 1, NotSerialized)
    {
        INAB = Arg0
        Return (DAAB) /* \DAAB */
    }

    Method (WTAB, 2, NotSerialized)
    {
        INAB = Arg0
        DAAB = Arg1
    }

    Method (RWAB, 3, NotSerialized)
    {
        Local0 = (RDAB (Arg0) & Arg1)
        Local1 = (Local0 | Arg2)
        WTAB (Arg0, Local1)
    }

    Method (CABR, 3, NotSerialized)
    {
        Local0 = (Arg0 << 0x05)
        Local1 = (Local0 + Arg1)
        Local2 = (Local1 << 0x18)
        Local3 = (Local2 + Arg2)
        Return (Local3)
    }

    Method (GENC, 0, NotSerialized)
    {
        Local0 = Zero
        While ((Local0 < 0x04))
        {
            Local1 = RDAB (CABR (0x03, Local0, 0xA4))
            Local1 &= 0x0800
            If ((Local1 != Zero))
            {
                Return (0x0F)
            }

            Local0++
            Stall (0xC8)
        }

        Return (Zero)
    }

    Method (GHPS, 2, NotSerialized)
    {
        If ((Arg0 == Zero))
        {
            If ((Arg1 == Zero))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFEFFF, Zero)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFEFE, Zero)
                DET0 = One
            }

            If ((Arg1 == 0x02))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, Zero)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, Zero)
                DET2 = One
            }

            Stall (0xC8)
        }

        If ((Arg0 == One))
        {
            RWAB (CABR (0x03, Arg1, 0xA2), 0xFFFDFFFF, 0x00020000)
            RWAB (CABR (0x03, Arg1, 0xA2), 0xFFFFFEFF, 0x0100)
            If ((Arg1 == Zero))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFEFFF, 0x1000)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFEFE, 0x0101)
                DET0 = Zero
            }

            If ((Arg1 == 0x02))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, 0x4000)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, 0x0404)
                DET2 = Zero
            }

            RWAB (CABR (0x03, Arg1, 0xA2), 0xFFFDFFFF, Zero)
            Stall (0xC8)
        }

        If (GGN2)
        {
            If ((Arg0 == Zero))
            {
                GEN2 ()
                Local0 = RDAB (CABR (0x03, 0x02, 0xA5))
                Local0 &= 0xFF
                Local1 = 0x01F4
                While (((Local1 > Zero) && (Local0 != 0x10)))
                {
                    Local0 = RDAB (CABR (0x03, 0x02, 0xA5))
                    Local0 &= 0xFF
                    Local1--
                    Stall (0xC8)
                    Stall (0xC8)
                }

                If ((Local0 != 0x10))
                {
                    GEN1 ()
                }
            }

            If ((GENC () == Zero))
            {
                RWAB (CABR (One, Zero, 0x40), 0xFFFFFFF7, 0x08)
            }
            Else
            {
                RWAB (CABR (One, Zero, 0x40), 0xFFFFFFF7, Zero)
            }

            Stall (0xC8)
        }
    }

    Method (GEN2, 0, NotSerialized)
    {
        TLS2 = 0x02
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, One)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        RWAB (CABR (0x03, 0x02, 0xC0), 0xFFFF7FFF, 0x8000)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xDFFFFFFF, 0x20000000)
        Stall (0xC8)
        Stall (0xC8)
    }

    Method (GEN1, 0, NotSerialized)
    {
        TLS2 = One
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, Zero)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        Stall (0xC8)
        Stall (0xC8)
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    Method (SPTS, 1, NotSerialized)
    {
        PCMD = One
        P80 = Arg0
        CPMS ()
        CPMS ()
        PEWS = One
    }

    Method (SWAK, 1, NotSerialized)
    {
        CPMS ()
        CPMS ()
        PEWS = One
    }

    Method (TRMD, 1, NotSerialized)
    {
    }

    Method (CPMS, 0, NotSerialized)
    {
        If ((EPNM == Zero))
        {
            PMSA = One
            PMSB = One
            PMSC = One
            PMS0 = One
            PMS1 = One
            PMS2 = One
            PMS3 = One
        }
    }

    Scope (_GPE)
    {
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x1B)
        {
            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0009FFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x000DFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x03, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKH, 
                Zero
            }
        })
        Name (AR00, Package (0x1B)
        {
            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x37
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x34
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x34
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x34
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x34
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x35
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                Zero, 
                0x35
            }, 

            Package (0x04)
            {
                0x0009FFFF, 
                Zero, 
                Zero, 
                0x35
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                Zero, 
                0x36
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                Zero, 
                0x36
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                Zero, 
                0x36
            }, 

            Package (0x04)
            {
                0x000DFFFF, 
                Zero, 
                Zero, 
                0x36
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x02, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x03, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x17
            }
        })
        Name (PR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKH, 
                Zero
            }
        })
        Name (AR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x17
            }
        })
        Name (PR21, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKE, 
                Zero
            }
        })
        Name (AR21, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x14
            }
        })
        Name (PR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKF, 
                Zero
            }
        })
        Name (AR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x15
            }
        })
        Name (PR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKG, 
                Zero
            }
        })
        Name (AR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x16
            }
        })
        Name (PR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x18
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x1A
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x1B
            }
        })
        Name (PR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKH, 
                Zero
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x1D
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x1F
            }
        })
        Name (PR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKH, 
                Zero
            }
        })
        Name (AR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2E
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2F
            }
        })
        Name (PR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKF, 
                Zero
            }
        })
        Name (AR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x2E
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x2F
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2D
            }
        })
        Name (PR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x33
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x30
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x31
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x32
            }
        })
        Name (PR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x32
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x33
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x30
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x31
            }
        })
        Name (PR19, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR19, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x30
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x31
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x32
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x33
            }
        })
        Name (PR1A, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKG, 
                Zero
            }
        })
        Name (AR1A, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x2F
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2E
            }
        })
        Name (PR1B, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR1B, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x20
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x21
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x22
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x23
            }
        })
        Name (PR1C, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKH, 
                Zero
            }
        })
        Name (AR1C, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x26
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x27
            }
        })
        Name (PR1D, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR1D, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x28
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x29
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2A
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2B
            }
        })
        Name (PR0C, Package (0x05)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKF, 
                Zero
            }
        })
        Name (AR0C, Package (0x05)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x15
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {4,7,10,11,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Name (PRSD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,10,11,14,15}
        })
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
            Name (_ADR, 0x00180000)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00) /* \_SB_.AR00 */
                }

                Return (PR00) /* \_SB_.PR00 */
            }

            Name (CPRB, One)
            Name (LVGA, 0x01)
            Name (STAV, 0x0F)
            Name (BRB, 0x0000)
            Name (BRL, 0x0100)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0xC0000000)
            Name (MBL, 0x40000000)
            Name (MABL, 0x00000000)
            Name (MABH, 0x00000000)
            Name (MALL, 0x00000000)
            Name (MALH, 0x00000000)
            Name (MAML, 0x00000000)
            Name (MAMH, 0x00000000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y00)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDFC0000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y08, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (STAV) /* \_SB_.PCI0.STAV */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    MIN0 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN0 = BRL /* \_SB_.PCI0.BRL_ */
                    Local0 = LEN0 /* \_SB_.PCI0._CRS.LEN0 */
                    MAX0 = (MIN0 + Local0--)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If ((IOB == 0x1000))
                    {
                        Local0 = IOL /* \_SB_.PCI0.IOL_ */
                        MAX1 = (IOB + Local0--)
                        Local0 = (MAX1 - MIN1) /* \_SB_.PCI0._CRS.MIN1 */
                        LEN1 = (Local0 + One)
                    }
                    Else
                    {
                        MIN1 = IOB /* \_SB_.PCI0.IOB_ */
                        LEN1 = IOL /* \_SB_.PCI0.IOL_ */
                        Local0 = LEN1 /* \_SB_.PCI0._CRS.LEN1 */
                        MAX1 = (MIN1 + Local0--)
                    }

                    If (((LVGA == One) || (LVGA == 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            IMN1 = 0x03B0
                            IMX1 = 0x03DF
                            ILN1 = 0x30
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            VMN1 = 0x000A0000
                            VMX1 = 0x000BFFFF
                            VLN1 = 0x00020000
                            VGAF = Zero
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    MIN3 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN3 = MBL /* \_SB_.PCI0.MBL_ */
                    Local0 = LEN3 /* \_SB_.PCI0._CRS.LEN3 */
                    MAX3 = (MIN3 + Local0--)
                    If ((MALH || MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Local0 = (0xB4 + 0x04)
                        CreateDWordField (CRS1, Local0, MN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Local1 = (0xBC + 0x04)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Local2 = (0xCC + 0x04)
                        CreateDWordField (CRS1, Local2, LN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        LN8L = MALL /* \_SB_.PCI0.MALL */
                        LN8H = MALH /* \_SB_.PCI0.MALH */
                        MX8L = MAML /* \_SB_.PCI0.MAML */
                        MX8H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS1) /* \_SB_.PCI0.CRS1 */
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    MIN2 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN2 = BRL /* \_SB_.PCI0.BRL_ */
                    Local1 = LEN2 /* \_SB_.PCI0._CRS.LEN2 */
                    MAX2 = (MIN2 + Local1--)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    MIN4 = IOB /* \_SB_.PCI0.IOB_ */
                    LEN4 = IOL /* \_SB_.PCI0.IOL_ */
                    Local1 = LEN4 /* \_SB_.PCI0._CRS.LEN4 */
                    MAX4 = (MIN4 + Local1--)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        IMN2 = 0x03B0
                        IMX2 = 0x03DF
                        ILN2 = 0x30
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        VMN2 = 0x000A0000
                        VMX2 = 0x000BFFFF
                        VLN2 = 0x00020000
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    MIN5 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN5 = MBL /* \_SB_.PCI0.MBL_ */
                    Local1 = LEN5 /* \_SB_.PCI0._CRS.LEN5 */
                    MAX5 = (MIN5 + Local1--)
                    If ((MALH || MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Local0 = (0x72 + 0x04)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Local1 = (0x7A + 0x04)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Local2 = (0x8A + 0x04)
                        CreateDWordField (CRS2, Local2, LN9H)
                        MN9L = MABL /* \_SB_.PCI0.MABL */
                        MN9H = MABH /* \_SB_.PCI0.MABH */
                        LN9L = MALL /* \_SB_.PCI0.MALL */
                        LN9H = MALH /* \_SB_.PCI0.MALH */
                        MX9L = MAML /* \_SB_.PCI0.MAML */
                        MX9H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS2) /* \_SB_.PCI0.CRS2 */
                }
            }

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Device (AMDN)
                    {
                        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                        Name (_UID, 0xC8)  // _UID: Unique ID
                        Name (_STA, 0x0F)  // _STA: Status
                        Name (NPTR, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y0C)
                        })
                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            CreateDWordField (NPTR, \_SB.PCI0.AMDN._Y0C._LEN, PL)  // _LEN: Length
                            CreateDWordField (NPTR, \_SB.PCI0.AMDN._Y0C._BAS, PB)  // _BAS: Base Address
                            PB = PEBS /* \PEBS */
                            PL = PEBL /* \PEBL */
                            Return (NPTR) /* \_SB_.PCI0.AMDN.NPTR */
                        }
                    }
                }
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (SMBS, PCI_Config, Zero, 0x0100)
                Field (SMBS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x08), 
                    REV,    8, 
                    Offset (0x62), 
                    I1F,    1, 
                    I12F,   1, 
                        ,   2, 
                    MT3A,   1, 
                    Offset (0xF8), 
                    EIDX,   8, 
                    Offset (0xFC), 
                    EDAT,   32
                }

                IndexField (EIDX, EDAT, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    Offset (0x05), 
                        ,   3, 
                    G39E,   1, 
                    G41E,   1, 
                    Offset (0x06), 
                    Offset (0x07), 
                        ,   3, 
                    G39O,   1, 
                    G41O,   1
                }

                OperationRegion (WIDE, PCI_Config, 0xAD, One)
                Field (WIDE, AnyAcc, NoLock, Preserve)
                {
                    DUM1,   4, 
                    SOPT,   1
                }

                OperationRegion (GPIO, SystemMemory, GIOB, 0x0100)
                Field (GPIO, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x06), 
                        ,   5, 
                    G06E,   1, 
                    G06O,   1, 
                    G06I,   1, 
                    G07B,   8, 
                    Offset (0x0B), 
                    G0BB,   8, 
                    Offset (0x0E), 
                    G0EB,   8, 
                    Offset (0x14), 
                        ,   5, 
                    G14E,   1, 
                    G14O,   1, 
                    G14I,   1, 
                        ,   5, 
                    G15E,   1, 
                    G15O,   1, 
                    G15I,   1, 
                    Offset (0x1C), 
                        ,   7, 
                    G1CI,   1, 
                    Offset (0x2D), 
                        ,   5, 
                    G2DE,   1, 
                    G2DO,   1, 
                    G2DI,   1, 
                    Offset (0x35), 
                        ,   5, 
                    G35E,   1, 
                    G35O,   1, 
                    Offset (0x37), 
                        ,   5, 
                    G37E,   1, 
                    G37O,   1, 
                    G37I,   1, 
                    Offset (0x65), 
                        ,   7, 
                    GE05,   1, 
                    Offset (0x6F), 
                        ,   7, 
                    GE15,   1, 
                        ,   7, 
                    GE16,   1, 
                    Offset (0x76), 
                        ,   7, 
                    GE22,   1, 
                    Offset (0xAA), 
                        ,   5, 
                    GAAE,   1, 
                    GAAO,   1, 
                    GAAI,   1, 
                    Offset (0xAF), 
                    GAFB,   8, 
                    GB0B,   8
                }

                OperationRegion (GPMX, SystemMemory, IOMB, 0x0100)
                Field (GPMX, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x06), 
                    G06M,   8, 
                    G07M,   8, 
                    Offset (0x0B), 
                    G0BM,   8, 
                    Offset (0x0E), 
                    G0EM,   8, 
                    Offset (0x14), 
                    G14M,   8, 
                    G15M,   8, 
                    Offset (0x1C), 
                    G1CM,   8, 
                    Offset (0x2D), 
                    G2DM,   8, 
                    Offset (0x37), 
                    G37M,   8, 
                    Offset (0x70), 
                    G70M,   8, 
                    Offset (0x76), 
                    G76M,   8, 
                    Offset (0xAF), 
                    GAFM,   8, 
                    GB0M,   8
                }
            }

            Device (IDEC)
            {
                Name (_ADR, 0x00140001)  // _ADR: Address
                Name (PPTM, Buffer (0x14)
                {
                    /* 0000 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                    /* 0008 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                    /* 0010 */  0x1F, 0x00, 0x00, 0x00                           // ....
                })
                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (PPTM) /* \_SB_.PCI0.IDEC.PPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (PPTM) /* \_SB_.PCI0.IDEC.PPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }
                }
            }

            Device (SBAZ)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, Zero, 0x0100)
                Field (PCI, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DNSP,   1, 
                    DNSO,   1, 
                    ENSR,   1
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1B, 0x04))
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                OperationRegion (RMBS, PCI_Config, Zero, 0x0100)
                Field (RMBS, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x6C), 
                    LR2S,   16, 
                    LR2E,   16
                }

                OperationRegion (SMIP, SystemIO, SMIO, One)
                Field (SMIP, ByteAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (GPIO, SystemMemory, SMIB, 0x0200)
                Field (GPIO, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x88), 
                        ,   1, 
                    CLPS,   1, 
                    Offset (0xB0), 
                        ,   2, 
                    SLPS,   2, 
                    Offset (0x10B), 
                    FSCR,   1, 
                    FSSR,   1, 
                    Offset (0x1BE), 
                        ,   5, 
                    ALLS,   1
                }

                Method (SPTS, 1, NotSerialized)
                {
                }

                Method (SWAK, 1, NotSerialized)
                {
                }

                Method (IPTS, 1, NotSerialized)
                {
                    CLPS = One
                    SLPS = One
                    ALLS = Zero
                    FSCR = Zero
                    FSSR = One
                }

                Device (S800)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x0700)  // _UID: Unique ID
                    Name (_STA, 0x0F)  // _STA: Status
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C52,             // Range Minimum
                            0x0C52,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD2,             // Range Minimum
                            0x0CD2,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0D)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y10)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0F)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0E)
                        IO (Decode16,
                            0x0900,             // Range Minimum
                            0x0900,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0910,             // Range Minimum
                            0x0910,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x00,               // Alignment
                            0xFF,               // Length
                            )
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y11)
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED80000,         // Address Base
                            0x00010000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED61000,         // Address Base
                            0x00010000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y12)
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y13)
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y14)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0D._MIN, PBB)  // _MIN: Minimum Base Address
                        CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0D._MAX, PBH)  // _MAX: Maximum Base Address
                        CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y0D._LEN, PML)  // _LEN: Length
                        PBB = PMBS /* \PMBS */
                        PBH = PMBS /* \PMBS */
                        PML = PMLN /* \PMLN */
                        If (SMBB)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0E._MIN, SMB1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0E._MAX, SMH1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y0E._LEN, SML1)  // _LEN: Length
                            SMB1 = SMBB /* \SMBB */
                            SMH1 = SMBB /* \SMBB */
                            SML1 = SMBL /* \SMBL */
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0F._MIN, SMB0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0F._MAX, SMH0)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y0F._LEN, SML0)  // _LEN: Length
                            SMB0 = SMB0 /* \_SB_.PCI0.SBRG.S800._CRS.SMB0 */
                            SMH0 = SMB0 /* \_SB_.PCI0.SBRG.S800._CRS.SMB0 */
                            SML0 = SMBM /* \SMBM */
                        }

                        If (GPBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y10._MIN, IGB)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y10._MAX, IGH)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y10._LEN, IGL)  // _LEN: Length
                            IGB = GPBS /* \GPBS */
                            IGH = GPBS /* \GPBS */
                            IGL = GPLN /* \GPLN */
                        }

                        If (APCB)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y11._BAS, APB)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y11._LEN, APL)  // _LEN: Length
                            APB = APCB /* \APCB */
                            APL = APCL /* \APCL */
                        }

                        If (SPIB)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y12._BAS, SPIB)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y12._LEN, SPIL)  // _LEN: Length
                            SPIB = \SPIB
                            SPIL = \SPIL
                        }

                        If (HPTB)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y13._BAS, HXTB)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y13._LEN, HXTL)  // _LEN: Length
                            HXTB = HPTB /* \HPTB */
                            HXTL = HPTL /* \HPTL */
                        }

                        CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y14._BAS, ROMB)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y14._LEN, ROML)  // _LEN: Length
                        If (LR2S)
                        {
                            ROMB = (LR2S << 0x10)
                            ROML = (((LR2E - LR2S) + One) << 0x10)
                        }
                        Else
                        {
                            ROMB = ROMS /* \ROMS */
                            ROML = (Zero - ROMS) /* \ROMS */
                        }

                        Return (CRS) /* \_SB_.PCI0.SBRG.S800.CRS_ */
                    }
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                    {
                        Return (SP1O) /* \SP1O */
                    }

                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y15)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y16)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y17)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (((SP1O < 0x03F0) && (SP1O > 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._MIN, GPI0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._MAX, GPI1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._LEN, GPIL)  // _LEN: Length
                            GPI0 = SP1O /* \SP1O */
                            GPI1 = SP1O /* \SP1O */
                            GPIL = 0x02
                        }

                        If (IO1B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._LEN, GPL1)  // _LEN: Length
                            GP10 = IO1B /* \IO1B */
                            GP11 = IO1B /* \IO1B */
                            GPL1 = IO1L /* \IO1L */
                        }

                        ENFG (0x03)
                        If (ACTR)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MIN, GP20)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MAX, GP21)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._LEN, GPL2)  // _LEN: Length
                            Local0 = (IOAH << 0x08)
                            Local0 |= IOAL
                            Local1 = (FindSetRightBit (Local0) - One)
                            Local1 = (One << Local1)
                            If ((OPT0 & 0x02)){}
                            Else
                            {
                                GP20 = (Local0 | 0x0400)
                                GP21 = (Local0 | 0x0400)
                                GPL2 = Local1
                            }
                        }

                        EXFG ()
                        Return (CRS) /* \_SB_.PCI0.SBRG.SIO1.CRS_ */
                    }

                    Name (DCAT, Package (0x15)
                    {
                        One, 
                        0x02, 
                        0x03, 
                        Zero, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x0A, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF
                    })
                    Mutex (MUT0, 0x00)
                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (MUT0, 0x0FFF)
                        INDX = 0x87
                        INDX = One
                        INDX = 0x55
                        If ((SP1O == 0x2E))
                        {
                            INDX = 0x55
                        }
                        Else
                        {
                            INDX = 0xAA
                        }

                        LDN = Arg0
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        INDX = 0x02
                        DATA = 0x02
                        Release (MUT0)
                    }

                    Method (LPTM, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Local0 = (OPT0 & 0x02)
                        EXFG ()
                        Return (Local0)
                    }

                    Method (UHID, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Local0 = (OPT0 & 0x03)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                        Else
                        {
                            Return (0x0105D041)
                        }
                    }

                    OperationRegion (IOID, SystemIO, SP1O, 0x02)
                    Field (IOID, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x21), 
                        SCF1,   8, 
                        SCF2,   8, 
                        SCF3,   8, 
                        SCF4,   8, 
                        SCF5,   8, 
                        SCF6,   8, 
                        Offset (0x29), 
                        CKCF,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IOH2,   8, 
                        IOL2,   8, 
                        Offset (0x70), 
                        INTR,   8, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xF0), 
                        OPT0,   8, 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8, 
                        OPT5,   8, 
                        OPT6,   8
                    }

                    Method (CGLD, 1, NotSerialized)
                    {
                        Return (DerefOf (DCAT [Arg0]))
                    }

                    Method (DSTA, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Local0 = ACTR /* \_SB_.PCI0.SBRG.SIO1.ACTR */
                        EXFG ()
                        If ((Local0 == 0xFF))
                        {
                            Return (Zero)
                        }

                        Local0 &= One
                        IOST |= (Local0 << Arg0)
                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        ElseIf (((One << Arg0) & IOST))
                        {
                            Return (0x0D)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (DCNT, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        If (((DMCH < 0x04) && ((Local1 = (DMCH & 0x03)) != Zero)))
                        {
                            RDMA (Arg0, Arg1, Local1++)
                        }

                        ACTR = Arg1
                        Local1 = (IOAH << 0x08)
                        Local1 |= IOAL
                        RRIO (Arg0, Arg1, Local1, 0x08)
                        EXFG ()
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1A)
                        IRQNoFlags (_Y18)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y19)
                            {}
                    })
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y18._INT, IRQM)  // _INT: Interrupts
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y19._DMA, DMAM)  // _DMA: Direct Memory Access
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MIN, IO11)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MAX, IO12)  // _MAX: Maximum Base Address
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._LEN, LEN1)  // _LEN: Length
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1D)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1E)
                        IRQNoFlags (_Y1B)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1C)
                            {2}
                    })
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1B._INT, IRQE)  // _INT: Interrupts
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1C._DMA, DMAE)  // _DMA: Direct Memory Access
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MIN, IO21)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MAX, IO22)  // _MAX: Maximum Base Address
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._LEN, LEN2)  // _LEN: Length
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MIN, IO31)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MAX, IO32)  // _MAX: Maximum Base Address
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._LEN, LEN3)  // _LEN: Length
                    Name (CRS4, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y20)
                        IRQ (Edge, ActiveHigh, Shared, _Y1F)
                            {}
                    })
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y1F._INT, IRQL)  // _INT: Interrupts
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y1F._HE, IRQS)  // _HE_: High-Edge
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MIN, IOHL)  // _MIN: Minimum Base Address
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MAX, IORL)  // _MAX: Maximum Base Address
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._ALN, ALMN)  // _ALN: Alignment
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._LEN, LENG)  // _LEN: Length
                    Method (DCRS, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        IO11 = (IOAH << 0x08)
                        IO11 |= IOAL /* \_SB_.PCI0.SBRG.SIO1.IO11 */
                        IO12 = IO11 /* \_SB_.PCI0.SBRG.SIO1.IO11 */
                        Local0 = (FindSetRightBit (IO11) - One)
                        LEN1 = (One << Local0)
                        If (INTR)
                        {
                            IRQM = (One << INTR) /* \_SB_.PCI0.SBRG.SIO1.INTR */
                        }
                        Else
                        {
                            IRQM = Zero
                        }

                        If (((DMCH > 0x03) || (Arg1 == Zero)))
                        {
                            DMAM = Zero
                        }
                        Else
                        {
                            Local1 = (DMCH & 0x03)
                            DMAM = (One << Local1)
                        }

                        EXFG ()
                        Return (CRS1) /* \_SB_.PCI0.SBRG.SIO1.CRS1 */
                    }

                    Method (DCR2, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        IO21 = (IOAH << 0x08)
                        IO21 |= IOAL /* \_SB_.PCI0.SBRG.SIO1.IO21 */
                        IO22 = IO21 /* \_SB_.PCI0.SBRG.SIO1.IO21 */
                        Local0 = (FindSetRightBit (IO21) - One)
                        LEN2 = (One << Local0)
                        IO31 = (IOH2 << 0x08)
                        IO31 |= IOL2 /* \_SB_.PCI0.SBRG.SIO1.IO31 */
                        IO32 = IO21 /* \_SB_.PCI0.SBRG.SIO1.IO21 */
                        Local0 = (FindSetRightBit (IO31) - One)
                        LEN3 = (One << Local0)
                        If (INTR)
                        {
                            IRQE = (One << INTR) /* \_SB_.PCI0.SBRG.SIO1.INTR */
                        }
                        Else
                        {
                            IRQE = Zero
                        }

                        If (((DMCH > 0x03) || (Arg1 == Zero)))
                        {
                            DMAE = Zero
                        }
                        Else
                        {
                            Local1 = (DMCH & 0x03)
                            DMAE = (One << Local1)
                        }

                        EXFG ()
                        Return (CRS2) /* \_SB_.PCI0.SBRG.SIO1.CRS2 */
                    }

                    Method (DCR4, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        IOHL = (IOAH << 0x08)
                        IOHL |= IOAL /* \_SB_.PCI0.SBRG.SIO1.IOHL */
                        IORL = IOHL /* \_SB_.PCI0.SBRG.SIO1.IOHL */
                        Local0 = (FindSetRightBit (IOHL) - One)
                        LENG = (One << Local0)
                        If (INTR)
                        {
                            INTR &= 0x0F
                            IRQL = (One << INTR) /* \_SB_.PCI0.SBRG.SIO1.INTR */
                        }
                        Else
                        {
                            IRQL = Zero
                        }

                        EXFG ()
                        Return (CRS4) /* \_SB_.PCI0.SBRG.SIO1.CRS4 */
                    }

                    Method (DSRS, 2, NotSerialized)
                    {
                        If ((Arg1 == 0x02))
                        {
                            If (LPTM (0x02))
                            {
                                DSR2 (Arg0, Arg1)
                            }
                        }
                        Else
                        {
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateByteField (Arg0, 0x0C, DMAM)
                            CreateWordField (Arg0, 0x02, IO11)
                            ENFG (CGLD (Arg1))
                            IOAL = (IO11 & 0xFF)
                            IOAH = (IO11 >> 0x08)
                            If (IRQM)
                            {
                                FindSetRightBit (IRQM, Local0)
                                INTR = (Local0 - One)
                            }
                            Else
                            {
                                INTR = Zero
                            }

                            If (DMAM)
                            {
                                FindSetRightBit (DMAM, Local0)
                                DMCH = (Local0 - One)
                            }
                            Else
                            {
                                DMCH = 0x04
                            }

                            EXFG ()
                            DCNT (Arg1, One)
                            Local2 = Arg1
                            If ((Local2 > Zero))
                            {
                                Local2 -= One
                            }
                        }
                    }

                    Method (DSR2, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x11, IRQT)
                        CreateByteField (Arg0, 0x14, DMAT)
                        CreateWordField (Arg0, 0x02, IOT1)
                        CreateWordField (Arg0, 0x0A, IOT2)
                        ENFG (CGLD (Arg1))
                        IOAL = (IOT1 & 0xFF)
                        IOAH = (IOT1 >> 0x08)
                        IOL2 = (IOT2 & 0xFF)
                        IOH2 = (IOT2 >> 0x08)
                        If (IRQT)
                        {
                            FindSetRightBit (IRQT, Local0)
                            INTR = (Local0 - One)
                        }
                        Else
                        {
                            INTR = Zero
                        }

                        If (DMAT)
                        {
                            FindSetRightBit (DMAT, Local0)
                            DMCH = (Local0 - One)
                        }
                        Else
                        {
                            DMCH = 0x04
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Local2 = Arg1
                        If ((Local2 > Zero))
                        {
                            Local2 -= One
                        }
                    }

                    Method (DSR4, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, IOHL)
                        CreateWordField (Arg0, 0x09, IRQL)
                        ENFG (CGLD (Arg1))
                        IOAL = (IOHL & 0xFF)
                        IOAH = (IOHL >> 0x08)
                        If (IRQL)
                        {
                            FindSetRightBit (IRQL, Local0)
                            INTR = (Local0 - One)
                        }
                        Else
                        {
                            INTR = Zero
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Local2 = Arg1
                        If ((Local2 > Zero))
                        {
                            Local2 -= One
                        }
                    }
                }

                Name (PMFG, Zero)
                Method (SIOS, 1, NotSerialized)
                {
                    Debug = "SIOS"
                    If ((0x05 != Arg0))
                    {
                        ^SIO1.ENFG (0x04)
                        If (KBFG)
                        {
                            ^SIO1.OPT0 |= 0x08
                        }
                        Else
                        {
                            ^SIO1.OPT0 &= 0xF7
                        }

                        If (MSFG)
                        {
                            ^SIO1.OPT0 |= 0x10
                        }
                        Else
                        {
                            ^SIO1.OPT0 &= 0xEF
                        }

                        ^SIO1.OPT1 = 0xFF
                        Local0 = (0xBF & ^SIO1.OPT2) /* \_SB_.PCI0.SBRG.SIO1.OPT2 */
                        ^SIO1.OPT2 = Local0
                        ^SIO1.LDN = 0x06
                        ^SIO1.ACTR = Zero
                        ^SIO1.LDN = 0x05
                        ^SIO1.ACTR = Zero
                        ^SIO1.EXFG ()
                    }
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Debug = "SIOW"
                    ^SIO1.ENFG (0x04)
                    PMFG = ^SIO1.OPT1 /* \_SB_.PCI0.SBRG.SIO1.OPT1 */
                    ^SIO1.OPT1 = 0xFF
                    ^SIO1.OPT0 &= 0xE7
                    Local0 = (0x40 | ^SIO1.OPT2) /* \_SB_.PCI0.SBRG.SIO1.OPT2 */
                    ^SIO1.OPT2 = Local0
                    ^SIO1.LDN = 0x06
                    ^SIO1.ACTR = One
                    ^SIO1.LDN = 0x05
                    ^SIO1.ACTR = One
                    ^SIO1.EXFG ()
                }

                Method (SIOH, 0, NotSerialized)
                {
                    If ((PMFG & 0x08))
                    {
                        Notify (PS2K, 0x02) // Device Wake
                    }

                    If ((PMFG & 0x10))
                    {
                        Notify (PS2M, 0x02) // Device Wake
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            _Y21)
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            _Y22)
                    })
                    CreateWordField (_CRS, \_SB.PCI0.SBRG.EC0._Y21._MIN, DPRT)  // _MIN: Minimum Base Address
                    CreateWordField (_CRS, \_SB.PCI0.SBRG.EC0._Y22._MIN, CPRT)  // _MIN: Minimum Base Address
                    Name (_GPE, 0x0A)  // _GPE: General Purpose Events
                    Name (REGC, Zero)
                    Method (_Q80, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \AMW0.AMWN (0x05)
                    }

                    Method (_Q81, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \AMW0.AMWN (0x00010005)
                    }

                    Method (_Q82, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \AMW0.AMWN (0x00020005)
                    }

                    Method (_Q83, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \AMW0.AMWN (0x00030005)
                    }
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Scope (SBRG)
                        {
                            Method (RRIO, 4, NotSerialized)
                            {
                                Debug = "RRIO"
                            }

                            Method (RDMA, 3, NotSerialized)
                            {
                                Debug = "rDMA"
                            }
                        }
                    }
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((MBEC & 0xFFFF))
                        {
                            Return (CRS1) /* \_SB_.PCI0.SBRG.RMSC.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.SBRG.RMSC.CRS2 */
                        }
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (NBRM)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x99)  // _UID: Unique ID
                    Name (CRS, Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (CRS) /* \_SB_.PCI0.SBRG.NBRM.CRS_ */
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP030B"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        KBFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Method (PS2K._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x03, 0x03))
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03") /* Microsoft PS/2-style Mouse */)  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((IOST & 0x0400))
                        {
                            Return (CRS1) /* \_SB_.PCI0.SBRG.PS2M.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.SBRG.PS2M.CRS2 */
                        }
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        MSFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Method (PS2M._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x03, 0x03))
                }

                Device (UAR1)
                {
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        Return (^^SIO1.UHID (Zero))
                    }

                    Method (_STA, 0, Serialized)  // _STA: Status
                    {
                        If ((IOST & One))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (^^SIO1.DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        ^^SIO1.DSRS (Arg0, Zero)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR1._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x16, 0x04))
                }

                Scope (^^PCI0)
                {
                    Name (SLIC, Buffer (0x9E)
                    {
                        "847339457828Genuine NVIDIA Certified SLI Ready Motherboard for ASUS M5A99FX PRO R20d97b-Copyright 2011 NVIDIA Corporation All Rights Reserved-948502369474(R)"
                    })
                    Device (WMI1)
                    {
                        Name (_HID, "pnp0c14")  // _HID: Hardware ID
                        Name (_UID, "MXM2")  // _UID: Unique ID
                        Name (_WDG, Buffer (0x14)
                        {
                            /* 0000 */  0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E,  // <\.....N
                            /* 0008 */  0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0,  // .w...*,.
                            /* 0010 */  0x4D, 0x58, 0x01, 0x02                           // MX..
                        })
                        Method (WMMX, 3, NotSerialized)
                        {
                            CreateDWordField (Arg2, Zero, FUNC)
                            If ((FUNC == 0x41494C53))
                            {
                                Return (SLIC) /* \_SB_.PCI0.SLIC */
                            }

                            Return (Zero)
                        }
                    }
                }
            }

            Device (P0PC)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x04, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0C) /* \_SB_.AR0C */
                    }

                    Return (PR0C) /* \_SB_.PR0C */
                }
            }

            Device (UHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC2)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC6)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC7)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                }

                OperationRegion (SACS, PCI_Config, Zero, 0x40)
                Field (SACS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x24), 
                    STB5,   32
                }

                Name (SPTM, Buffer (0x14)
                {
                    /* 0000 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                    /* 0008 */  0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // x.......
                    /* 0010 */  0x1F, 0x00, 0x00, 0x00                           // ....
                })
                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((STCL == 0x0101))
                        {
                            Local1 = 0x0F
                        }
                        Else
                        {
                            Local1 = Zero
                        }

                        Return (Local1)
                    }

                    Name (PRIS, Zero)
                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                        Field (BAR, AnyAcc, NoLock, Preserve)
                        {
                            Offset (0x120), 
                                ,   7, 
                            PMBY,   1, 
                            Offset (0x128), 
                            PMS0,   4, 
                            Offset (0x129), 
                            PMS1,   4, 
                            Offset (0x220), 
                                ,   7, 
                            PSBY,   1, 
                            Offset (0x228), 
                            PSS0,   4, 
                            Offset (0x229), 
                            PSS1,   4, 
                            Offset (0x2A0), 
                                ,   7
                        }

                        If (((OSTY == 0x06) || (OSTY == 0x04)))
                        {
                            If (PMS1)
                            {
                                Local0 = 0x32
                                While (((PMBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }

                            If (PSS1)
                            {
                                Local0 = 0x32
                                While (((PSBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        PRIS = Zero
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        PRIS = 0x03
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (PRIS) /* \_SB_.PCI0.SATA.PRID.PRIS */
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x128), 
                                PMS0,   4, 
                                Offset (0x129), 
                                PMS1,   4
                            }

                            If (~(PMS1 == Zero))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x120), 
                                    ,   7, 
                                PMBY,   1
                            }

                            Local0 = 0x32
                            While (((PMBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.PRID.P_D0.S12P */
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x228), 
                                PSS0,   4, 
                                Offset (0x229), 
                                PSS1,   4
                            }

                            If (~(PSS1 == Zero))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x220), 
                                    ,   7, 
                                PSBY,   1
                            }

                            Local0 = 0x32
                            While (((PSBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.PRID.P_D1.S12P */
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                    }

                    Name (SECS, Zero)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((STCL == 0x0101))
                        {
                            Local1 = 0x0F
                        }
                        Else
                        {
                            Local1 = Zero
                        }

                        Return (Local1)
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                        Field (BAR, AnyAcc, NoLock, Preserve)
                        {
                            Offset (0x1A0), 
                                ,   7, 
                            SMBY,   1, 
                            Offset (0x1A8), 
                            SMS0,   4, 
                            Offset (0x1A9), 
                            SMS1,   4, 
                            Offset (0x2A0), 
                                ,   7, 
                            SSBY,   1, 
                            Offset (0x2A8), 
                            SSS0,   4, 
                            Offset (0x2A9), 
                            SSS1,   4, 
                            Offset (0x2AC)
                        }

                        If (((OSTY == 0x06) || (OSTY == 0x04)))
                        {
                            If (SMS1)
                            {
                                Local0 = 0x32
                                While (((SMBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }

                            If (SSS1)
                            {
                                Local0 = 0x32
                                While (((SSBY == One) && Local0))
                                {
                                    Sleep (0xFA)
                                    Local0--
                                }
                            }
                        }

                        SECS = Zero
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        SECS = 0x03
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (SECS) /* \_SB_.PCI0.SATA.SECD.SECS */
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x1A8), 
                                SMS0,   4, 
                                Offset (0x1A9), 
                                SMS1,   4
                            }

                            If (~(SMS1 == Zero))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x1000)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x1A0), 
                                    ,   7, 
                                SMBY,   1
                            }

                            Local0 = 0x32
                            While (((SMBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.SECD.S_D0.S12P */
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x2A8), 
                                SSS0,   4, 
                                Offset (0x2A9), 
                                SSS1,   4
                            }

                            If (~(SSS1 == Zero))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x2A0), 
                                    ,   7, 
                                SSBY,   1
                            }

                            Local0 = 0x32
                            While (((SSBY == One) && Local0))
                            {
                                Sleep (0xFA)
                                Local0--
                            }

                            S12P = Zero
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            S12P = 0x03
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (S12P) /* \_SB_.PCI0.SATA.SECD.S_D1.S12P */
                        }
                    }
                }
            }

            Device (IOMA)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                OperationRegion (NBF2, PCI_Config, Zero, 0x0100)
                Field (NBF2, AnyAcc, NoLock, Preserve)
                {
                    DID,    32, 
                    Offset (0x44), 
                    MBAS,   32
                }

                Device (^UMEM)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x15)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y23)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.UMEM._Y23._BAS, BAS3)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.UMEM._Y23._LEN, LEN3)  // _LEN: Length
                        If ((^^IOMA.DID != 0xFFFFFFFF))
                        {
                            LEN3 = 0x4000
                            BAS3 = (^^IOMA.MBAS & 0xFFFFC000)
                        }

                        Return (CRS) /* \_SB_.PCI0.UMEM.CRS_ */
                    }
                }
            }

            Device (RD8A)
            {
                Name (_ADR, Zero)  // _ADR: Address
                OperationRegion (NB2, PCI_Config, Zero, 0x0100)
                Field (NB2, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    MI,     32, 
                    MD,     32, 
                    Offset (0x94), 
                    HI,     32, 
                    HD,     32, 
                    Offset (0xF8), 
                    API,    32, 
                    APD,    32
                }

                Device (NMEM)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x14)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y24)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y25)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.RD8A.NMEM._Y24._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.RD8A.NMEM._Y24._LEN, LEN1)  // _LEN: Length
                        MI = 0x3C
                        Local0 = MD /* \_SB_.PCI0.RD8A.MD__ */
                        If ((Local0 & 0x40))
                        {
                            MI = 0x3A
                            BAS1 = (MD & 0xFFFFFF00)
                            LEN1 = ((MD & 0xFF) << 0x17)
                        }

                        CreateDWordField (CRS, \_SB.PCI0.RD8A.NMEM._Y25._BAS, BAS2)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.RD8A.NMEM._Y25._LEN, LEN2)  // _LEN: Length
                        API = Zero
                        Local1 = APD /* \_SB_.PCI0.RD8A.APD_ */
                        If ((Local1 & One))
                        {
                            LEN2 = 0x0100
                            API = One
                            BAS2 = (APD & 0xFFFFFF00)
                        }

                        Return (CRS) /* \_SB_.PCI0.RD8A.NMEM.CRS_ */
                    }
                }
            }

            Device (PC02)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12) /* \_SB_.AR12 */
                    }

                    Return (PR12) /* \_SB_.PR12 */
                }
            }

            Device (PC03)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR13) /* \_SB_.AR13 */
                    }

                    Return (PR13) /* \_SB_.PR13 */
                }
            }

            Device (PC04)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR14) /* \_SB_.AR14 */
                    }

                    Return (PR14) /* \_SB_.PR14 */
                }
            }

            Device (PC05)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR15) /* \_SB_.AR15 */
                    }

                    Return (PR15) /* \_SB_.PR15 */
                }
            }

            Device (PC06)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR16) /* \_SB_.AR16 */
                    }

                    Return (PR16) /* \_SB_.PR16 */
                }
            }

            Device (PC07)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17) /* \_SB_.AR17 */
                    }

                    Return (PR17) /* \_SB_.PR17 */
                }
            }

            Device (PC09)
            {
                Name (_ADR, 0x00090000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR19) /* \_SB_.AR19 */
                    }

                    Return (PR19) /* \_SB_.PR19 */
                }
            }

            Device (PC0A)
            {
                Name (_ADR, 0x000A0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1A) /* \_SB_.AR1A */
                    }

                    Return (PR1A) /* \_SB_.PR1A */
                }
            }

            Device (PC0B)
            {
                Name (_ADR, 0x000B0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1B) /* \_SB_.AR1B */
                    }

                    Return (PR1B) /* \_SB_.PR1B */
                }
            }

            Device (PC0C)
            {
                Name (_ADR, 0x000C0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1C) /* \_SB_.AR1C */
                    }

                    Return (PR1C) /* \_SB_.PR1C */
                }
            }

            Device (PC0D)
            {
                Name (_ADR, 0x000D0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1D) /* \_SB_.AR1D */
                    }

                    Return (PR1D) /* \_SB_.PR1D */
                }
            }

            Device (PE20)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0F, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR20) /* \_SB_.AR20 */
                    }

                    Return (PR20) /* \_SB_.PR20 */
                }
            }

            Device (PE21)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x10, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR21) /* \_SB_.AR21 */
                    }

                    Return (PR21) /* \_SB_.PR21 */
                }
            }

            Device (PE22)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR22) /* \_SB_.AR22 */
                    }

                    Return (PR22) /* \_SB_.PR22 */
                }
            }

            Device (PE23)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x12, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR23) /* \_SB_.AR23 */
                    }

                    Return (PR23) /* \_SB_.PR23 */
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB5)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.SBAZ, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                \_SB.PCI0.SBRG.SIOH ()
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L16, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                \_SB.PCI0.SBRG.SIOH ()
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.P0PC, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.UHC1, 0x02) // Device Wake
                Notify (\_SB.PCI0.UHC2, 0x02) // Device Wake
                Notify (\_SB.PCI0.UHC4, 0x02) // Device Wake
                Notify (\_SB.PCI0.UHC6, 0x02) // Device Wake
                Notify (\_SB.PCI0.UHC7, 0x02) // Device Wake
                Notify (\_SB.PCI0.USB3, 0x02) // Device Wake
                Notify (\_SB.PCI0.USB5, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PC02, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC03, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC04, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC05, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC06, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC07, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC09, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC0A, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC0B, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC0C, 0x02) // Device Wake
                Notify (\_SB.PCI0.PC0D, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0F, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PE20, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PE21, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PE22, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L12, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PE23, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x16, 0x04))
            }
        }
    }

    Scope (_SB)
    {
        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x10), 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x15), 
            GEC,    8, 
            Offset (0x30), 
            USB1,   8, 
            USB2,   8, 
            USB3,   8, 
            USB4,   8, 
            USB5,   8, 
            USB6,   8, 
            USB7,   8, 
            Offset (0x40), 
            IDE,    8, 
            SATA,   8, 
            Offset (0x50), 
            GPP0,   8, 
            GPP1,   8, 
            GPP2,   8, 
            GPP3,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (IRQC, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Local1 = PD64 /* \_SB_.PD64 */
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            PIRA = Arg0
            HDAD = Arg0
            GEC = Arg0
            GPP0 = Arg0
            GPP0 = Arg0
        }

        Method (INTB, 1, NotSerialized)
        {
            PIRB = Arg0
            USB2 = Arg0
            USB4 = Arg0
            USB6 = Arg0
            GPP1 = Arg0
            IDE = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            PIRC = Arg0
            USB1 = Arg0
            USB3 = Arg0
            USB5 = Arg0
            USB7 = Arg0
            GPP2 = Arg0
        }

        Method (INTD, 1, NotSerialized)
        {
            PIRD = Arg0
            SATA = Arg0
            GPP3 = Arg0
        }

        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Name (IPRA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRB, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRA)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTA (Local0)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRB)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB) /* \_SB_.PRSB */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTB (Local0)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRC)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC) /* \_SB_.PRSC */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTC (Local0)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRD)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD) /* \_SB_.PRSD */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                INTD (Local0)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRE)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE) /* \_SB_.PRSE */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (PIRE, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRF)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF) /* \_SB_.PRSF */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRG)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG) /* \_SB_.PRSG */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRH)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH) /* \_SB_.PRSH */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }
    }

    Scope (_PR)
    {
        OperationRegion (SSDT, SystemMemory, 0xFFFF0000, 0xFFFF)
        Name (DCOR, 0x02)
        Name (TBLD, 0x04)
        Name (NPSS, 0x05)
        Name (HNDL, 0x80000000)
        Name (APSS, Package (0x0A)
        {
            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }
        })
        Processor (P001, 0x01, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P001._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P002, 0x02, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P002._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P003, 0x03, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P003._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P004, 0x04, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P004._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P005, 0x05, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P005._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P006, 0x06, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P006._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P007, 0x07, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P007._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }

        Processor (P008, 0x08, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                TYPE = DAT0 /* \_PR_.P008._PDC.DAT0 */
                If (((TBLD == Zero) && (NPSS != Zero)))
                {
                    If ((((TYPE & 0x1B) == 0x1B) || (DCOR == Zero)))
                    {
                        TBLD = One
                        Load (SSDT, HNDL) /* \_PR_.HNDL */
                    }
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If ((RVID <= 0x13)){}
        }
    }

    Device (HPET)
    {
        Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
        Name (CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadOnly,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                _Y26)
        })
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            CreateDWordField (CRS, \HPET._Y26._BAS, HPT)  // _BAS: Base Address
            HPT = 0xFED00000
            Return (CRS) /* \HPET.CRS_ */
        }
    }

    If (OSCF)
    {
        Scope (_SB.PCI0)
        {
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        (CTRL & 0x1E)
                    }

                    CTRL &= 0x1D
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)){}
                        If ((CTRL & 0x04))
                        {
                            EPNM = One
                        }
                        Else
                        {
                            EPNM = Zero
                        }

                        If ((CTRL & 0x10)){}
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0._OSC.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        DBG8 = Arg0
        If (((Arg0 == 0x04) && (OSFL () == 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        WAKP [Zero] = Zero
        WAKP [One] = Zero
        WSSB = ASSB /* \ASSB */
        WOTB = AOTB /* \AOTB */
        WAXB = AAXB /* \AAXB */
        ASSB = Arg0
        AOTB = OSFL ()
        AAXB = Zero
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG8 = (Arg0 << 0x04)
        WAK (Arg0)
        If (IOWK){}
        Else
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If (ASSB)
        {
            ASSB = WSSB /* \WSSB */
            AOTB = WOTB /* \WOTB */
            AAXB = WAXB /* \WAXB */
        }

        If (DerefOf (WAKP [Zero]))
        {
            WAKP [One] = Zero
        }
        Else
        {
            WAKP [One] = Arg0
        }

        Return (WAKP) /* \WAKP */
    }

    OperationRegion (IORK, SystemIO, 0xB3, One)
    Field (IORK, ByteAcc, NoLock, Preserve)
    {
        IOWK,   8
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    Scope (\)
    {
        Device (AMW0)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, "ASUSWMI")  // _UID: Unique ID
            Name (_WDG, Buffer (0x50)
            {
                /* 0000 */  0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11,  // .^..mN..
                /* 0008 */  0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66,  // .9.. ..f
                /* 0010 */  0x42, 0x43, 0x01, 0x02, 0xA0, 0x47, 0x67, 0x46,  // BC...GgF
                /* 0018 */  0xEC, 0x70, 0xDE, 0x11, 0x8A, 0x39, 0x08, 0x00,  // .p...9..
                /* 0020 */  0x20, 0x0C, 0x9A, 0x66, 0x42, 0x44, 0x01, 0x02,  //  ..fBD..
                /* 0028 */  0x72, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1, 0x11,  // r.......
                /* 0030 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00, 0x00,  // ....)...
                /* 0038 */  0xD2, 0x00, 0x01, 0x08, 0x21, 0x12, 0x90, 0x05,  // ....!...
                /* 0040 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
                /* 0048 */  0xC9, 0x06, 0x29, 0x10, 0x4D, 0x4F, 0x01, 0x00   // ..).MO..
            })
            Name (CCAC, Zero)
            Name (ECD2, Zero)
            Name (EID2, Zero)
            Method (WED2, 1, NotSerialized)
            {
                ECD2 = Arg0
            }

            Method (WMBC, 3, NotSerialized)
            {
                Local0 = One
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = Arg1
                If ((_T_0 == 0x43455053))
                {
                    Return (SPEC (Arg2))
                }
                ElseIf ((_T_0 == 0x50564544))
                {
                    Return (DEVP (Arg2))
                }
                ElseIf ((_T_0 == 0x50534453))
                {
                    Return (SDSP (Arg2))
                }
                ElseIf ((_T_0 == 0x50534447))
                {
                    Return (GDSP (Arg2))
                }
                ElseIf ((_T_0 == 0x53564544))
                {
                    Return (DEVS (Arg2))
                }
                ElseIf ((_T_0 == 0x53544344))
                {
                    Return (DSTS (Arg2))
                }
                ElseIf ((_T_0 == 0x44495047))
                {
                    Return (GPID ())
                }
                ElseIf ((_T_0 == 0x5446424B))
                {
                    Return (KBFT (Arg2))
                }
                ElseIf ((_T_0 == 0x59454B48))
                {
                    Return (HKEY ())
                }
                Else
                {
                    Return (Zero)
                }

                Return (Local0)
            }

            Method (RSMB, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WSMB, 1, Serialized)
            {
                Return (Zero)
            }

            Method (RSMW, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WSMW, 1, Serialized)
            {
                Return (Zero)
            }

            Method (RSMK, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WSMK, 1, Serialized)
            {
                Return (Zero)
            }

            Method (WMBD, 3, NotSerialized)
            {
                Local0 = One
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = Arg1
                If ((_T_0 == 0x424D5352))
                {
                    Return (RSMB (Arg2))
                }
                ElseIf ((_T_0 == 0x424D5357))
                {
                    Return (WSMB (Arg2))
                }
                ElseIf ((_T_0 == 0x574D5352))
                {
                    Return (RSMW (Arg2))
                }
                ElseIf ((_T_0 == 0x574D5357))
                {
                    Return (WSMW (Arg2))
                }
                ElseIf ((_T_0 == 0x4B4D5352))
                {
                    Return (RSMK (Arg2))
                }
                ElseIf ((_T_0 == 0x4B4D5357))
                {
                    Return (WSMK (Arg2))
                }
                Else
                {
                    Return (Zero)
                }

                Return (Local0)
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                If ((Arg0 == 0xD2))
                {
                    Return (EID2) /* \AMW0.EID2 */
                }

                Return (Zero)
            }

            Method (AMWR, 1, Serialized)
            {
                Local1 = Zero
                If (ECD2)
                {
                    EID2 = Arg0
                    Notify (AMW0, 0xD2) // Hardware-Specific
                    Local1 = One
                }
                Else
                {
                }

                Return (Local1)
            }

            Method (AMWN, 1, Serialized)
            {
                Local0 = AMWR (Arg0)
                Return (Local0)
            }

            Name (WQMO, Buffer (0x09A6)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0x96, 0x09, 0x00, 0x00, 0x42, 0x38, 0x00, 0x00,  // ....B8..
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0xA8, 0xD1, 0x9A, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
                /* 0020 */  0x10, 0x07, 0x10, 0x4A, 0x29, 0x86, 0x42, 0x04,  // ...J).B.
                /* 0028 */  0x0A, 0x0D, 0xA1, 0x38, 0x0A, 0x60, 0x30, 0x12,  // ...8.`0.
                /* 0030 */  0x20, 0x24, 0x07, 0x42, 0x2E, 0x98, 0x98, 0x00,  //  $.B....
                /* 0038 */  0x11, 0x10, 0xF2, 0x2A, 0xC0, 0xA6, 0x00, 0x93,  // ...*....
                /* 0040 */  0x20, 0xEA, 0xDF, 0x1F, 0xA2, 0x24, 0x38, 0x94,  //  ....$8.
                /* 0048 */  0x10, 0x08, 0x49, 0x14, 0x60, 0x5E, 0x80, 0x6E,  // ..I.`^.n
                /* 0050 */  0x01, 0x86, 0x05, 0xD8, 0x16, 0x60, 0x5A, 0x80,  // .....`Z.
                /* 0058 */  0x63, 0x48, 0x2A, 0x0D, 0x9C, 0x12, 0x58, 0x0A,  // cH*...X.
                /* 0060 */  0x84, 0x84, 0x0A, 0x50, 0x2E, 0xC0, 0xB7, 0x00,  // ...P....
                /* 0068 */  0xED, 0x88, 0x92, 0x2C, 0xC0, 0x32, 0x8C, 0x08,  // ...,.2..
                /* 0070 */  0x3C, 0x8A, 0xC8, 0x46, 0xE3, 0x04, 0x65, 0x43,  // <..F..eC
                /* 0078 */  0xA3, 0x64, 0x40, 0xC8, 0xB3, 0x00, 0xEB, 0xC0,  // .d@.....
                /* 0080 */  0x84, 0xC0, 0xEE, 0x05, 0x98, 0x13, 0xE0, 0x4D,  // .......M
                /* 0088 */  0x80, 0xB8, 0x61, 0x68, 0x85, 0x07, 0x10, 0xAA,  // ..ah....
                /* 0090 */  0x30, 0x01, 0xB6, 0x60, 0x84, 0x52, 0x1B, 0x8C,  // 0..`.R..
                /* 0098 */  0x50, 0x1A, 0x43, 0xD0, 0x30, 0x8C, 0x12, 0xF1,  // P.C.0...
                /* 00A0 */  0x90, 0x3A, 0x83, 0x15, 0x4A, 0xC4, 0x30, 0x21,  // .:..J.0!
                /* 00A8 */  0x22, 0x54, 0x86, 0x41, 0x86, 0x15, 0x2A, 0x5A,  // "T.A..*Z
                /* 00B0 */  0xDC, 0x08, 0xED, 0x0F, 0x82, 0x44, 0x5B, 0xB1,  // .....D[.
                /* 00B8 */  0x86, 0xEA, 0x48, 0xA3, 0x41, 0x0D, 0x2F, 0xC1,  // ..H.A./.
                /* 00C0 */  0xE1, 0x7A, 0xA8, 0xE7, 0xD8, 0xB9, 0x00, 0xE9,  // .z......
                /* 00C8 */  0xC0, 0x02, 0x09, 0x7E, 0x16, 0x75, 0x8E, 0x93,  // ...~.u..
                /* 00D0 */  0x80, 0x24, 0x30, 0xD6, 0xF1, 0xB3, 0x81, 0xE3,  // .$0.....
                /* 00D8 */  0x5D, 0x03, 0x6A, 0xC6, 0xC7, 0xCB, 0x04, 0xC1,  // ].j.....
                /* 00E0 */  0xA1, 0x86, 0xE8, 0x81, 0x86, 0x3B, 0x81, 0x43,  // .....;.C
                /* 00E8 */  0x64, 0x80, 0x9E, 0xD3, 0xD1, 0x60, 0x0E, 0x00,  // d....`..
                /* 00F0 */  0x76, 0x38, 0x19, 0xDD, 0x03, 0x4A, 0x15, 0x60,  // v8...J.`
                /* 00F8 */  0x76, 0xCC, 0xB2, 0x08, 0xA4, 0xF1, 0x18, 0xFA,  // v.......
                /* 0100 */  0x74, 0xCF, 0xE7, 0x84, 0x13, 0x58, 0xFE, 0x20,  // t....X. 
                /* 0108 */  0x50, 0x23, 0x33, 0xB4, 0x0D, 0x4E, 0x4B, 0x98,  // P#3..NK.
                /* 0110 */  0x21, 0x0F, 0xFF, 0xB0, 0x98, 0x58, 0x08, 0x7D,  // !....X.}
                /* 0118 */  0x10, 0x3C, 0x1E, 0x78, 0xFF, 0xFF, 0xF1, 0x80,  // .<.x....
                /* 0120 */  0x47, 0xF1, 0x99, 0x40, 0x08, 0xAF, 0x04, 0xB1,  // G..@....
                /* 0128 */  0x3D, 0xA0, 0xE7, 0x04, 0x03, 0x63, 0x07, 0x64,  // =....c.d
                /* 0130 */  0xBF, 0x02, 0x10, 0x82, 0x97, 0x39, 0x22, 0x39,  // .....9"9
                /* 0138 */  0x45, 0xD0, 0x98, 0x8C, 0xD1, 0x2A, 0x84, 0x86,  // E....*..
                /* 0140 */  0x10, 0xDA, 0x10, 0x67, 0x17, 0xFF, 0xE0, 0x0D,  // ...g....
                /* 0148 */  0x73, 0xEE, 0x26, 0x28, 0x72, 0x04, 0xA8, 0xCF,  // s.&(r...
                /* 0150 */  0x84, 0x47, 0xC0, 0x8F, 0x01, 0xD1, 0x43, 0x9F,  // .G....C.
                /* 0158 */  0x4D, 0xF4, 0xE3, 0x89, 0x72, 0x12, 0x07, 0xE4,  // M...r...
                /* 0160 */  0x33, 0x83, 0x11, 0x82, 0x97, 0x7B, 0x48, 0x20,  // 3....{H 
                /* 0168 */  0x9A, 0xE7, 0xA0, 0x13, 0xC3, 0x39, 0x1D, 0x02,  // .....9..
                /* 0170 */  0x53, 0xA3, 0x05, 0xA2, 0x09, 0x10, 0x45, 0x59,  // S.....EY
                /* 0178 */  0xAA, 0x6C, 0x2C, 0xD5, 0x83, 0xA0, 0x82, 0x80,  // .l,.....
                /* 0180 */  0x34, 0x77, 0x43, 0x9C, 0xB4, 0x91, 0x03, 0xC7,  // 4wC.....
                /* 0188 */  0xA8, 0x7E, 0xD8, 0x54, 0x04, 0x9C, 0x0E, 0x1B,  // .~.T....
                /* 0190 */  0x1E, 0xB7, 0xE3, 0x93, 0x28, 0xFA, 0x80, 0x28,  // ....(..(
                /* 0198 */  0x9C, 0xC3, 0x9E, 0x39, 0x28, 0x88, 0x01, 0x9D,  // ...9(...
                /* 01A0 */  0x04, 0x42, 0x4E, 0x8E, 0x02, 0xA8, 0xBD, 0x68,  // .BN....h
                /* 01A8 */  0x58, 0x1A, 0xD7, 0xA9, 0xBD, 0x09, 0x78, 0x5A,  // X.....xZ
                /* 01B0 */  0x8F, 0x05, 0x87, 0x71, 0x5C, 0x67, 0x6D, 0xD1,  // ...q\gm.
                /* 01B8 */  0x37, 0x06, 0x3A, 0x1F, 0xDF, 0x05, 0xB8, 0x06,  // 7.:.....
                /* 01C0 */  0x08, 0xCD, 0xC8, 0xF0, 0x56, 0x03, 0x48, 0xC1,  // ....V.H.
                /* 01C8 */  0xF8, 0x49, 0xE0, 0x11, 0xC0, 0x04, 0xD6, 0x75,  // .I.....u
                /* 01D0 */  0x20, 0x80, 0x7E, 0xD9, 0xF0, 0xF0, 0x7D, 0xC2,  //  .~...}.
                /* 01D8 */  0x78, 0xBC, 0x48, 0x50, 0xDF, 0x7D, 0x00, 0x14,  // x.HP.}..
                /* 01E0 */  0x40, 0x3E, 0x00, 0x58, 0xE9, 0x1D, 0x80, 0x8E,  // @>.X....
                /* 01E8 */  0x21, 0x44, 0x98, 0x68, 0x46, 0xE7, 0x12, 0x56,  // !D.hF..V
                /* 01F0 */  0xAA, 0xFF, 0xFF, 0x68, 0xF9, 0x41, 0xC5, 0xA3,  // ...h.A..
                /* 01F8 */  0x35, 0x88, 0x47, 0xEB, 0x40, 0xA3, 0x45, 0x1F,  // 5.G.@.E.
                /* 0200 */  0x33, 0xAC, 0x70, 0x54, 0xF2, 0x39, 0x01, 0x0D,  // 3.pT.9..
                /* 0208 */  0x17, 0x06, 0x41, 0xE1, 0x07, 0x0E, 0x68, 0x80,  // ..A...h.
                /* 0210 */  0xA7, 0xF7, 0x66, 0xE0, 0x99, 0x18, 0xCE, 0xF3,  // ..f.....
                /* 0218 */  0xE5, 0x70, 0x9E, 0x2F, 0x1F, 0x8E, 0x0F, 0x14,  // .p./....
                /* 0220 */  0xF0, 0x07, 0x8C, 0x25, 0x28, 0x70, 0xC2, 0x20,  // ...%(p. 
                /* 0228 */  0x87, 0xC7, 0x08, 0x1E, 0x2C, 0x95, 0x35, 0x2E,  // ....,.5.
                /* 0230 */  0xD4, 0xFD, 0xC0, 0x27, 0x1A, 0x86, 0x7D, 0xA8,  // ...'..}.
                /* 0238 */  0x47, 0xF3, 0x96, 0x70, 0x86, 0x6F, 0x13, 0x07,  // G..p.o..
                /* 0240 */  0xF5, 0xEE, 0x61, 0xA7, 0x42, 0x2D, 0x3A, 0x84,  // ..a.B-:.
                /* 0248 */  0xF5, 0x48, 0x39, 0xAC, 0xD1, 0xC2, 0x1E, 0xF0,  // .H9.....
                /* 0250 */  0x73, 0x87, 0xEF, 0x19, 0xFC, 0x4A, 0xE3, 0x63,  // s....J.c
                /* 0258 */  0x08, 0x5D, 0x85, 0x4E, 0x15, 0x5C, 0x14, 0x84,  // .].N.\..
                /* 0260 */  0xE2, 0xAD, 0x45, 0xC3, 0x3F, 0x0B, 0x8F, 0xEB,  // ..E.?...
                /* 0268 */  0x15, 0xC3, 0x57, 0x80, 0x87, 0x13, 0x9F, 0x01,  // ..W.....
                /* 0270 */  0xE2, 0x07, 0x3A, 0x82, 0x17, 0x11, 0x9F, 0x7D,  // ..:....}
                /* 0278 */  0x7C, 0x79, 0xF1, 0x21, 0x83, 0x9D, 0x2C, 0x78,  // |y.!..,x
                /* 0280 */  0x08, 0x0A, 0xC5, 0x38, 0x1C, 0xA0, 0x84, 0xC3,  // ...8....
                /* 0288 */  0x08, 0xCE, 0x20, 0x1E, 0x9E, 0x83, 0x1C, 0x0E,  // .. .....
                /* 0290 */  0xD0, 0xE7, 0x20, 0x0F, 0x84, 0x0D, 0xC2, 0x20,  // .. .... 
                /* 0298 */  0xE7, 0xF1, 0xF2, 0xC3, 0x2E, 0x16, 0xF8, 0xFF,  // ........
                /* 02A0 */  0xFF, 0xC5, 0x02, 0x78, 0xA5, 0x19, 0x14, 0x5A,  // ...x...Z
                /* 02A8 */  0xCF, 0xA0, 0x20, 0x60, 0x3C, 0x3F, 0x78, 0xBC,  // .. `<?x.
                /* 02B0 */  0x9E, 0xAD, 0xA7, 0x05, 0xDE, 0x11, 0xFB, 0xFC,  // ........
                /* 02B8 */  0x01, 0x9C, 0xC3, 0x1F, 0x5E, 0x50, 0x71, 0x87,  // ....^Pq.
                /* 02C0 */  0x44, 0x41, 0x7C, 0x36, 0x70, 0x94, 0xF1, 0xA2,  // DA|6p...
                /* 02C8 */  0x67, 0xE2, 0xC3, 0x90, 0x8F, 0x0B, 0x4F, 0x37,  // g.....O7
                /* 02D0 */  0x98, 0xC3, 0x07, 0xB8, 0x47, 0xE2, 0xC3, 0x07,  // ....G...
                /* 02D8 */  0xF0, 0xF8, 0xFF, 0x1F, 0x3E, 0x80, 0x9F, 0x44,  // ....>..D
                /* 02E0 */  0x8B, 0x5A, 0x85, 0x1E, 0x3E, 0xC0, 0x15, 0xE4,  // .Z..>...
                /* 02E8 */  0x84, 0x84, 0x96, 0x73, 0xF8, 0x40, 0x4E, 0x24,  // ...s.@N$
                /* 02F0 */  0x4C, 0x74, 0x9F, 0x91, 0x5E, 0x3C, 0x2C, 0xE1,  // Lt..^<,.
                /* 02F8 */  0xE0, 0x81, 0x0A, 0x4F, 0xA2, 0xF8, 0xA7, 0x02,  // ...O....
                /* 0300 */  0x54, 0xE0, 0x53, 0x01, 0x05, 0x31, 0xA0, 0x0F,  // T.S..1..
                /* 0308 */  0x15, 0x70, 0x66, 0xF0, 0xEC, 0x85, 0x99, 0x07,  // .pf.....
                /* 0310 */  0x8C, 0x33, 0x12, 0x60, 0xEB, 0x50, 0x01, 0xDE,  // .3.`.P..
                /* 0318 */  0xFF, 0xFF, 0xA1, 0x02, 0x38, 0x1C, 0x90, 0x00,  // ....8...
                /* 0320 */  0x59, 0x12, 0x2F, 0x48, 0x0F, 0x15, 0xE0, 0x3A,  // Y./H...:
                /* 0328 */  0x70, 0xFA, 0x50, 0xC1, 0x0F, 0x9A, 0x16, 0x05,  // p.P.....
                /* 0330 */  0xA4, 0x23, 0x9E, 0x0F, 0x15, 0x30, 0x2E, 0x42,  // .#...0.B
                /* 0338 */  0x86, 0x7F, 0xAD, 0x3B, 0x96, 0xE7, 0x30, 0x72,  // ...;..0r
                /* 0340 */  0xAE, 0x40, 0xC7, 0x3E, 0x18, 0xA0, 0x82, 0x8E,  // .@.>....
                /* 0348 */  0x9E, 0x82, 0x18, 0xD0, 0x29, 0x0E, 0x06, 0x68,  // ....)..h
                /* 0350 */  0x1D, 0xE7, 0x0A, 0xD4, 0x31, 0x0E, 0xF8, 0xFD,  // ....1...
                /* 0358 */  0xFF, 0xCF, 0x14, 0xC0, 0x49, 0xC4, 0xD1, 0x0A,  // ....I...
                /* 0360 */  0x35, 0x5C, 0x8F, 0xD5, 0x20, 0x1E, 0xAB, 0x8F,  // 5\.. ...
                /* 0368 */  0xA1, 0x1E, 0x2B, 0xEE, 0x1B, 0xE0, 0x23, 0x00,  // ..+...#.
                /* 0370 */  0xFE, 0xE8, 0x84, 0x03, 0x7B, 0xAE, 0x00, 0x4C,  // ....{..L
                /* 0378 */  0x7B, 0x3C, 0x57, 0x80, 0x4E, 0xDA, 0xD9, 0x07,  // {<W.N...
                /* 0380 */  0x1D, 0x70, 0xAD, 0x3A, 0x89, 0xE1, 0xCF, 0x71,  // .p.:...q
                /* 0388 */  0x8C, 0x60, 0xA8, 0xC3, 0x1B, 0x85, 0x70, 0x1C,  // .`....p.
                /* 0390 */  0x0A, 0x85, 0x39, 0x19, 0xD0, 0xFF, 0xFF, 0x11,  // ..9.....
                /* 0398 */  0x96, 0xC0, 0x51, 0x10, 0x0F, 0xCD, 0x61, 0xCE,  // ..Q...a.
                /* 03A0 */  0x70, 0xA0, 0x39, 0x16, 0xC0, 0xBB, 0x55, 0xB0,  // p.9...U.
                /* 03A8 */  0x63, 0x01, 0x6C, 0x02, 0x1F, 0x0B, 0xC0, 0x17,  // c.l.....
                /* 03B0 */  0x67, 0x58, 0xE8, 0xD1, 0xFA, 0xFE, 0x87, 0xBB,  // gX......
                /* 03B8 */  0x3F, 0x44, 0x79, 0x29, 0xF6, 0x21, 0x07, 0xEE,  // ?Dy).!..
                /* 03C0 */  0xB8, 0xC0, 0x71, 0x7A, 0x00, 0x5C, 0x1D, 0xC4,  // ..qz.\..
                /* 03C8 */  0xE4, 0xF4, 0xF4, 0x00, 0xAE, 0x24, 0xA7, 0x07,  // .....$..
                /* 03D0 */  0xD4, 0x80, 0xFD, 0xFF, 0xD7, 0x03, 0xA4, 0x73,  // .......s
                /* 03D8 */  0x02, 0xF6, 0xA2, 0xCD, 0x20, 0x4E, 0xF4, 0x79,  // .... N.y
                /* 03E0 */  0xC4, 0x0A, 0x8E, 0x38, 0xA8, 0xEC, 0x24, 0x4A,  // ...8..$J
                /* 03E8 */  0x7E, 0xC4, 0x41, 0x65, 0x1D, 0x3B, 0x05, 0x31,  // ~.Ae.;.1
                /* 03F0 */  0xA0, 0x4F, 0x94, 0x80, 0x8F, 0x3B, 0x0E, 0xB0,  // .O...;..
                /* 03F8 */  0xD8, 0xA8, 0x27, 0xCB, 0x23, 0x4F, 0x96, 0x82,  // ..'.#O..
                /* 0400 */  0x78, 0xB2, 0xBE, 0x54, 0x00, 0x87, 0x1B, 0x0E,  // x..T....
                /* 0408 */  0xB0, 0xFF, 0xFF, 0x5F, 0x2A, 0x80, 0x92, 0x43,  // ..._*..C
                /* 0410 */  0xA9, 0x97, 0x0A, 0x90, 0xC9, 0xBB, 0xE1, 0xA0,  // ........
                /* 0418 */  0x43, 0xAE, 0x55, 0xF7, 0x3A, 0x76, 0x6C, 0xF5,  // C.U.:vl.
                /* 0420 */  0xB8, 0x7D, 0x93, 0xC6, 0x04, 0xBB, 0xE1, 0xA0,  // .}......
                /* 0428 */  0x22, 0x51, 0x28, 0xD0, 0xB9, 0x00, 0x15, 0x01,  // "Q(.....
                /* 0430 */  0x8E, 0x82, 0x78, 0x68, 0x3E, 0x17, 0x58, 0xC9,  // ..xh>.X.
                /* 0438 */  0xB9, 0x00, 0xED, 0xFD, 0x42, 0x41, 0x06, 0xE7,  // ....BA..
                /* 0440 */  0x7B, 0x81, 0x61, 0x8A, 0x1F, 0x8A, 0xEE, 0x3D,  // {.a....=
                /* 0448 */  0x3E, 0x17, 0x80, 0xFB, 0x8A, 0x03, 0x2E, 0x63,  // >......c
                /* 0450 */  0x02, 0xB4, 0x41, 0x92, 0x7B, 0xB8, 0xC7, 0x85,  // ..A.{...
                /* 0458 */  0x1B, 0x87, 0x47, 0x75, 0x4C, 0x31, 0x9F, 0xE3,  // ..GuL1..
                /* 0460 */  0x82, 0x3C, 0xC7, 0x79, 0x5E, 0xB8, 0xF3, 0x03,  // .<.y^...
                /* 0468 */  0x70, 0xFB, 0xFF, 0x0F, 0x0C, 0xD6, 0x85, 0x0B,  // p.......
                /* 0470 */  0x88, 0x0B, 0x35, 0x29, 0xF1, 0xFC, 0x00, 0xAE,  // ..5)....
                /* 0478 */  0x5B, 0xB7, 0xEF, 0x85, 0x38, 0x29, 0x77, 0x57,  // [...8)wW
                /* 0480 */  0x14, 0xC6, 0x2B, 0x49, 0x0C, 0xDF, 0x53, 0x8D,  // ..+I..S.
                /* 0488 */  0x6D, 0x98, 0x03, 0x38, 0x15, 0xE3, 0x24, 0x18,  // m..8..$.
                /* 0490 */  0xFC, 0xEC, 0x40, 0xC7, 0xE5, 0xC8, 0x24, 0xBA,  // ..@...$.
                /* 0498 */  0xED, 0xFB, 0x08, 0xC1, 0x63, 0x8E, 0x9E, 0x82,  // ....c...
                /* 04A0 */  0x18, 0xD0, 0x19, 0x4E, 0x2A, 0x68, 0x15, 0x20,  // ...N*h. 
                /* 04A8 */  0x9A, 0x02, 0xE6, 0xE6, 0x0A, 0xF8, 0xFB, 0xFF,  // ........
                /* 04B0 */  0xDF, 0x5C, 0x01, 0x56, 0xB8, 0x54, 0xA8, 0x51,  // .\.V.T.Q
                /* 04B8 */  0xEA, 0x91, 0x02, 0x5C, 0x77, 0x40, 0xDF, 0xC2,  // ...\w@..
                /* 04C0 */  0x70, 0x92, 0x80, 0x74, 0x65, 0x3D, 0x8D, 0x07,  // p..te=..
                /* 04C8 */  0x00, 0x5F, 0x29, 0x60, 0x5C, 0x3C, 0xD9, 0x11,  // ._)`\<..
                /* 04D0 */  0x87, 0xDF, 0xAE, 0x7D, 0x2C, 0x00, 0xE6, 0xFF,  // ...},...
                /* 04D8 */  0xFF, 0x2B, 0x21, 0x58, 0x8F, 0x05, 0xC0, 0x5B,  // .+!X...[
                /* 04E0 */  0xA4, 0x4B, 0x8B, 0x66, 0x8F, 0x05, 0xE0, 0x12,  // .K.f....
                /* 04E8 */  0xBF, 0x0A, 0x7A, 0x50, 0xB1, 0x5C, 0x18, 0x94,  // ..zP.\..
                /* 04F0 */  0x84, 0xB1, 0x43, 0x19, 0xCD, 0xC1, 0x1C, 0x43,  // ..C....C
                /* 04F8 */  0x70, 0x76, 0x86, 0x31, 0x1C, 0x1F, 0xA8, 0xA7,  // pv.1....
                /* 0500 */  0xFE, 0x58, 0x7B, 0x1A, 0xAF, 0x68, 0xBE, 0xE2,  // .X{..h..
                /* 0508 */  0xF9, 0x3E, 0x4A, 0x87, 0x88, 0xBA, 0xEA, 0x79,  // .>J....y
                /* 0510 */  0xAC, 0x6F, 0x05, 0xA7, 0xF6, 0xAC, 0xE7, 0x6B,  // .o.....k
                /* 0518 */  0x8B, 0x61, 0x12, 0x78, 0x88, 0x0C, 0x8D, 0x13,  // .a.x....
                /* 0520 */  0xBC, 0x23, 0x19, 0x9A, 0xCB, 0x80, 0xD0, 0x5D,  // .#.....]
                /* 0528 */  0xE9, 0x35, 0xC0, 0x73, 0x33, 0x41, 0xF7, 0x43,  // .5.s3A.C
                /* 0530 */  0x97, 0x42, 0x04, 0x9D, 0x00, 0xDE, 0x09, 0x6A,  // .B.....j
                /* 0538 */  0x14, 0xE0, 0xED, 0x2A, 0x20, 0x5B, 0x02, 0xC4,  // ...* [..
                /* 0540 */  0x8D, 0x5E, 0x58, 0x6F, 0x45, 0x51, 0x42, 0x44,  // .^XoEQBD
                /* 0548 */  0x08, 0x1A, 0xC5, 0x78, 0x11, 0x42, 0x85, 0x88,  // ...x.B..
                /* 0550 */  0x12, 0xB5, 0x39, 0x10, 0x5D, 0x8E, 0xA2, 0x06,  // ..9.]...
                /* 0558 */  0x89, 0x16, 0xCC, 0x08, 0xCC, 0xFE, 0x20, 0x88,  // ...... .
                /* 0560 */  0xF4, 0x67, 0x80, 0x2E, 0x33, 0xBE, 0x0C, 0x7B,  // .g..3..{
                /* 0568 */  0x34, 0xFC, 0x2C, 0xC5, 0x87, 0x7A, 0x8E, 0x8F,  // 4.,..z..
                /* 0570 */  0x8A, 0xEC, 0xFF, 0x0F, 0xF2, 0x5A, 0x68, 0x9D,  // .....Zh.
                /* 0578 */  0xE3, 0x24, 0x87, 0x1C, 0x83, 0xEB, 0x0C, 0x01,  // .$......
                /* 0580 */  0xCD, 0x35, 0xA0, 0x8E, 0xFD, 0x1E, 0xAF, 0xBF,  // .5......
                /* 0588 */  0x1A, 0x86, 0xE3, 0x43, 0xF4, 0xA1, 0xC2, 0x13,  // ...C....
                /* 0590 */  0x38, 0x44, 0x06, 0xE8, 0x43, 0x04, 0xFC, 0xF1,  // 8D..C...
                /* 0598 */  0x18, 0xFA, 0x29, 0xC2, 0x13, 0x7E, 0xA1, 0x25,  // ..)..~.%
                /* 05A0 */  0x83, 0x40, 0x9D, 0x34, 0xF8, 0x48, 0x5F, 0xB8,  // .@.4.H_.
                /* 05A8 */  0xD9, 0xED, 0xC3, 0x04, 0x16, 0x7B, 0x76, 0xA0,  // .....{v.
                /* 05B0 */  0xE3, 0x01, 0xBF, 0xE2, 0x33, 0x81, 0xAE, 0x71,  // ....3..q
                /* 05B8 */  0xC6, 0xF6, 0xC9, 0xC8, 0x11, 0x0E, 0x22, 0x50,  // ......"P
                /* 05C0 */  0x40, 0x9F, 0x4D, 0xF8, 0xCD, 0x83, 0x1D, 0x2D,  // @.M....-
                /* 05C8 */  0xB8, 0xA8, 0xA3, 0x05, 0xEA, 0xB4, 0xE0, 0x83,  // ........
                /* 05D0 */  0x02, 0x43, 0x7C, 0xF8, 0x34, 0xC4, 0x93, 0x05,  // .C|.4...
                /* 05D8 */  0x3B, 0xEA, 0x80, 0x53, 0xDE, 0x21, 0x04, 0x14,  // ;..S.!..
                /* 05E0 */  0x20, 0x3E, 0x59, 0xB0, 0x79, 0x61, 0x08, 0x2C,  //  >Y.ya.,
                /* 05E8 */  0x12, 0x1E, 0x75, 0xE8, 0x30, 0x3C, 0x3F, 0x25,  // ..u.0<?%
                /* 05F0 */  0x3C, 0x8E, 0x30, 0xEC, 0x37, 0x12, 0x4F, 0xE1,  // <.0.7.O.
                /* 05F8 */  0x70, 0x7C, 0xA4, 0x30, 0x42, 0xF0, 0x72, 0x4F,  // p|.0B.rO
                /* 0600 */  0x16, 0xE4, 0x62, 0x73, 0x74, 0xFF, 0xFF, 0x27,  // ..bst..'
                /* 0608 */  0x18, 0xCC, 0x50, 0x3D, 0x04, 0x7E, 0x5E, 0xF0,  // ..P=.~^.
                /* 0610 */  0x10, 0xF8, 0x00, 0x5A, 0x9D, 0x1D, 0x39, 0x9F,  // ...Z..9.
                /* 0618 */  0x9C, 0x13, 0x6E, 0xBC, 0x7C, 0x4C, 0xD8, 0x01,  // ..n.|L..
                /* 0620 */  0xF0, 0xE0, 0x4B, 0xF2, 0x59, 0x84, 0xC6, 0x58,  // ..K.Y..X
                /* 0628 */  0xBE, 0x8F, 0x23, 0x80, 0x9C, 0x49, 0x3C, 0x81,  // ..#..I<.
                /* 0630 */  0x44, 0x78, 0x19, 0x09, 0x12, 0xE2, 0x58, 0x5E,  // Dx....X^
                /* 0638 */  0x43, 0x0C, 0x12, 0xE3, 0xED, 0xC8, 0xC7, 0x11,  // C.......
                /* 0640 */  0x0E, 0xF3, 0x4C, 0x62, 0xB8, 0x87, 0x83, 0x57,  // ..Lb...W
                /* 0648 */  0x91, 0x17, 0x12, 0xC3, 0x3C, 0x8A, 0xF8, 0x7C,  // ....<..|
                /* 0650 */  0x10, 0xC3, 0x98, 0xA1, 0xA2, 0x9D, 0x80, 0x8F,  // ........
                /* 0658 */  0x23, 0xEC, 0x58, 0xE9, 0xA1, 0xFA, 0x38, 0x02,  // #.X...8.
                /* 0660 */  0x58, 0xFA, 0xFF, 0x1F, 0x47, 0x80, 0xF9, 0x11,  // X...G...
                /* 0668 */  0x01, 0x77, 0xDA, 0x80, 0x7B, 0x9F, 0x08, 0xF1,  // .w..{...
                /* 0670 */  0xA4, 0xF1, 0x92, 0xF0, 0xAC, 0x01, 0x5C, 0x84,  // ......\.
                /* 0678 */  0x6A, 0x39, 0xF7, 0xB0, 0x34, 0x8F, 0x01, 0x1D,  // j9..4...
                /* 0680 */  0xCF, 0x38, 0x87, 0x35, 0x01, 0x69, 0x98, 0xFC,  // .8.5.i..
                /* 0688 */  0xCA, 0xED, 0x73, 0xC1, 0xD9, 0x3D, 0x72, 0x1B,  // ..s..=r.
                /* 0690 */  0x26, 0xC8, 0x13, 0xC1, 0x6B, 0x94, 0xC1, 0x05,  // &...k...
                /* 0698 */  0xA9, 0xF3, 0x23, 0x4F, 0x4F, 0x21, 0xDD, 0x27,  // ..#OO!.'
                /* 06A0 */  0x5A, 0x94, 0xD2, 0x63, 0x1A, 0x05, 0xF1, 0x19,  // Z..c....
                /* 06A8 */  0xC1, 0x21, 0xCE, 0x31, 0xE8, 0xE1, 0x7B, 0x0E,  // .!.1..{.
                /* 06B0 */  0x67, 0x74, 0x20, 0xEF, 0x01, 0xEC, 0xFE, 0x08,  // gt .....
                /* 06B8 */  0x3C, 0x4F, 0x3A, 0x78, 0x74, 0xDF, 0x14, 0xCE,  // <O:xt...
                /* 06C0 */  0xF3, 0x4C, 0xFF, 0xFF, 0x47, 0x04, 0xDE, 0x99,  // .L..G...
                /* 06C8 */  0xFA, 0x82, 0x09, 0x9C, 0x43, 0xDC, 0x05, 0x50,  // ....C..P
                /* 06D0 */  0xB2, 0xEF, 0x02, 0x14, 0xC4, 0x13, 0xF3, 0xD5,  // ........
                /* 06D8 */  0x0F, 0x0E, 0xFE, 0xAB, 0x1F, 0x30, 0xB9, 0x2C,  // .....0.,
                /* 06E0 */  0xF8, 0x9A, 0x04, 0xBE, 0x53, 0x3F, 0xFE, 0xC2,  // ....S?..
                /* 06E8 */  0xE0, 0xDB, 0xC0, 0xC3, 0x13, 0x1B, 0x14, 0xF8,  // ........
                /* 06F0 */  0xA1, 0x7C, 0x3D, 0x04, 0xFF, 0xFF, 0xFF, 0x7A,  // .|=....z
                /* 06F8 */  0x08, 0x3C, 0x95, 0x3A, 0xB5, 0xA9, 0xF0, 0x7A,  // .<.:...z
                /* 0700 */  0x08, 0xAE, 0x28, 0xD7, 0x12, 0xD4, 0xAD, 0xC9,  // ..(.....
                /* 0708 */  0x82, 0x80, 0x74, 0x3F, 0x7F, 0xBE, 0x31, 0xA6,  // ..t?..1.
                /* 0710 */  0xCF, 0x25, 0xF0, 0xEE, 0xA0, 0x5A, 0x95, 0xEE,  // .%...Z..
                /* 0718 */  0x25, 0x3C, 0x38, 0x85, 0xA2, 0x1F, 0x1E, 0x50,  // %<8....P
                /* 0720 */  0x61, 0x0F, 0x0F, 0x14, 0xC4, 0x17, 0x23, 0xDF,  // a.....#.
                /* 0728 */  0x4B, 0x00, 0x0E, 0xFC, 0xFF, 0x47, 0xC4, 0x6F,  // K....G.o
                /* 0730 */  0xDA, 0x70, 0x8E, 0x16, 0x98, 0x19, 0x81, 0xF5,  // .p......
                /* 0738 */  0x44, 0xE0, 0x9B, 0x36, 0xE0, 0xE8, 0xE4, 0x02,  // D..6....
                /* 0740 */  0x5C, 0x4E, 0x25, 0x80, 0x2B, 0xAF, 0xA7, 0x12,  // \N%.+...
                /* 0748 */  0xFD, 0xFF, 0x4F, 0x25, 0xE0, 0xBA, 0x7B, 0x81,  // ..O%..{.
                /* 0750 */  0xE9, 0x6A, 0x72, 0x26, 0xD1, 0x82, 0xFB, 0xEE,  // .jr&....
                /* 0758 */  0x05, 0xF0, 0xF3, 0xFF, 0x7F, 0xF7, 0x02, 0x88,  // ........
                /* 0760 */  0xE9, 0xF5, 0xEE, 0x05, 0xBC, 0xCE, 0x25, 0x98,  // ......%.
                /* 0768 */  0xBB, 0x97, 0xFF, 0xFF, 0x77, 0x2F, 0x80, 0xFF,  // ....w/..
                /* 0770 */  0xFF, 0xFF, 0xBB, 0x17, 0x40, 0x96, 0x53, 0x09,  // ....@.S.
                /* 0778 */  0xC8, 0xB2, 0x9D, 0x4A, 0xD0, 0x0A, 0xCF, 0xD1,  // ...J....
                /* 0780 */  0x50, 0x27, 0x70, 0x28, 0x4F, 0x18, 0xAF, 0xEA,  // P'p(O...
                /* 0788 */  0x09, 0xAC, 0xE7, 0xF2, 0x85, 0x52, 0x02, 0xA3,  // .....R..
                /* 0790 */  0xCB, 0x17, 0xB0, 0xFB, 0xFF, 0x5F, 0xBE, 0x00,  // ....._..
                /* 0798 */  0x3E, 0x04, 0xBA, 0x0B, 0xA0, 0x22, 0xDC, 0x05,  // >...."..
                /* 07A0 */  0x28, 0x88, 0x2F, 0x5F, 0x80, 0x97, 0x50, 0x10,  // (./_..P.
                /* 07A8 */  0x32, 0x72, 0x93, 0xA0, 0x97, 0x2F, 0x38, 0x17,  // 2r.../8.
                /* 07B0 */  0x07, 0xDF, 0x8F, 0x3C, 0x28, 0x78, 0xFF, 0xFF,  // ...<(x..
                /* 07B8 */  0x41, 0xC1, 0x19, 0xCC, 0x79, 0x17, 0x7B, 0x52,  // A...y.{R
                /* 07C0 */  0xA4, 0xD7, 0x13, 0xB8, 0x77, 0x0E, 0x8F, 0x0D,  // ....w...
                /* 07C8 */  0x1C, 0xE2, 0xAE, 0x60, 0xC0, 0xDE, 0xE5, 0xED,  // ...`....
                /* 07D0 */  0x04, 0x5C, 0xDA, 0xD6, 0xAE, 0xDB, 0x09, 0x2E,  // .\......
                /* 07D8 */  0xE1, 0x71, 0x1A, 0xF2, 0xF1, 0x04, 0x93, 0xE7,  // .q......
                /* 07E0 */  0x76, 0x82, 0x4A, 0x02, 0xA3, 0x2C, 0x24, 0x3A,  // v.J..,$:
                /* 07E8 */  0x42, 0x70, 0xF5, 0x37, 0x31, 0x0A, 0x62, 0x0B,  // Bp.71.b.
                /* 07F0 */  0xB7, 0x13, 0x40, 0xC7, 0xFF, 0xFF, 0x76, 0x02,  // ..@...v.
                /* 07F8 */  0xFC, 0xC7, 0x0C, 0x67, 0x44, 0xEF, 0x15, 0x86,  // ...gD...
                /* 0800 */  0xF4, 0x19, 0x0C, 0x98, 0x06, 0x3A, 0x82, 0xA0,  // .....:..
                /* 0808 */  0x2F, 0x69, 0xD8, 0x04, 0x37, 0x10, 0x3A, 0x23,  // /i..7.:#
                /* 0810 */  0x78, 0x17, 0x10, 0xB8, 0x13, 0x83, 0x75, 0x00,  // x.....u.
                /* 0818 */  0x01, 0xDF, 0x59, 0x0D, 0x78, 0xFD, 0xFF, 0xCF,  // ..Y.x...
                /* 0820 */  0x6A, 0xC0, 0xF4, 0x00, 0xE0, 0xB3, 0x1A, 0xA0,  // j.......
                /* 0828 */  0xEA, 0xF6, 0x02, 0x32, 0x85, 0x36, 0x7D, 0x6A,  // ...2.6}j
                /* 0830 */  0x34, 0x6A, 0xD5, 0xA0, 0x4C, 0x8D, 0x32, 0x0D,  // 4j..L.2.
                /* 0838 */  0x6A, 0xF5, 0xA9, 0xD4, 0x98, 0x31, 0xBB, 0x60,  // j....1.`
                /* 0840 */  0x8A, 0x71, 0x7B, 0xA2, 0x22, 0x96, 0x23, 0x10,  // .q{.".#.
                /* 0848 */  0xEB, 0xA6, 0x90, 0x91, 0xCB, 0x86, 0x41, 0x04,  // ......A.
                /* 0850 */  0x64, 0xD9, 0x8B, 0x16, 0x10, 0x01, 0x11, 0x90,  // d.......
                /* 0858 */  0x85, 0xBC, 0x1B, 0x04, 0x64, 0x55, 0x20, 0x02,  // ....dU .
                /* 0860 */  0x72, 0x2A, 0x20, 0x1A, 0x11, 0x88, 0xC6, 0xF1,  // r* .....
                /* 0868 */  0x00, 0xC4, 0xC2, 0x81, 0x08, 0xC8, 0xEA, 0x4C,  // .......L
                /* 0870 */  0x00, 0x31, 0xA9, 0x20, 0xBA, 0x43, 0x90, 0xCF,  // .1. .C..
                /* 0878 */  0x85, 0x80, 0x2C, 0x12, 0x44, 0x40, 0xCE, 0xB8,  // ..,.D@..
                /* 0880 */  0x3E, 0x01, 0x39, 0x30, 0x88, 0x80, 0x1C, 0xF2,  // >.90....
                /* 0888 */  0x1B, 0x22, 0x20, 0x47, 0x06, 0x11, 0x90, 0x05,  // ." G....
                /* 0890 */  0xEB, 0x00, 0xF2, 0xFF, 0x9F, 0xA0, 0x7C, 0x10,  // ......|.
                /* 0898 */  0x01, 0x39, 0x3E, 0x10, 0x15, 0xE3, 0xE3, 0xAE,  // .9>.....
                /* 08A0 */  0x45, 0x1F, 0x03, 0x02, 0x72, 0x2E, 0x10, 0x01,  // E...r...
                /* 08A8 */  0x39, 0x07, 0x8D, 0x80, 0x9C, 0x8A, 0x42, 0x40,  // 9.....B@
                /* 08B0 */  0x56, 0xF5, 0x76, 0x10, 0x90, 0x35, 0x82, 0x08,  // V.v..5..
                /* 08B8 */  0xC8, 0x29, 0x81, 0x68, 0x66, 0x20, 0x2A, 0xD8,  // .).hf *.
                /* 08C0 */  0x0A, 0x10, 0x53, 0x0F, 0x22, 0x20, 0x2B, 0xD5,  // ..S." +.
                /* 08C8 */  0x02, 0xC4, 0x74, 0x83, 0x08, 0xC8, 0xA9, 0xBD,  // ..t.....
                /* 08D0 */  0x00, 0x31, 0x0D, 0xEF, 0x00, 0x01, 0x59, 0xEB,  // .1....Y.
                /* 08D8 */  0xD3, 0x43, 0x20, 0x4E, 0x0A, 0x42, 0xB5, 0xBA,  // .C N.B..
                /* 08E0 */  0x01, 0x61, 0x39, 0xED, 0x80, 0x30, 0x95, 0x7A,  // .a9..0.z
                /* 08E8 */  0x40, 0x58, 0x1E, 0x3F, 0x43, 0xA6, 0x20, 0x02,  // @X.?C. .
                /* 08F0 */  0xB2, 0xA2, 0x97, 0x88, 0x80, 0x2C, 0x0F, 0x44,  // .....,.D
                /* 08F8 */  0x40, 0x96, 0x62, 0x08, 0x88, 0x09, 0x03, 0x11,  // @.b.....
                /* 0900 */  0x90, 0x23, 0x01, 0xD1, 0x80, 0x40, 0x54, 0x9E,  // .#...@T.
                /* 0908 */  0x23, 0x20, 0xA6, 0x15, 0x44, 0x40, 0x0E, 0x08,  // # ..D@..
                /* 0910 */  0x44, 0xD3, 0x02, 0x51, 0x8D, 0xBF, 0x25, 0x01,  // D..Q..%.
                /* 0918 */  0x59, 0x30, 0x88, 0x80, 0x2C, 0xCE, 0xD2, 0x51,  // Y0..,..Q
                /* 0920 */  0x80, 0x82, 0x08, 0xC8, 0x31, 0x35, 0x0D, 0x95,  // ....15..
                /* 0928 */  0x82, 0x08, 0xC8, 0x42, 0x3D, 0x01, 0x31, 0xD5,  // ...B=.1.
                /* 0930 */  0x20, 0x02, 0xB2, 0x42, 0x51, 0x40, 0x4C, 0x2F,  //  ..BQ@L/
                /* 0938 */  0x88, 0x06, 0x49, 0x80, 0x68, 0x6E, 0x20, 0xAA,  // ..I.hn .
                /* 0940 */  0x5A, 0x15, 0x10, 0x8B, 0x00, 0x22, 0x20, 0xE7,  // Z...." .
                /* 0948 */  0x06, 0xA2, 0x22, 0x5C, 0x01, 0x31, 0xE9, 0x20,  // .."\.1. 
                /* 0950 */  0x02, 0x72, 0x0E, 0x20, 0xAA, 0xF9, 0x49, 0x21,  // .r. ..I!
                /* 0958 */  0x20, 0x27, 0x00, 0x11, 0x90, 0xF3, 0xDB, 0x3A,  //  '.....:
                /* 0960 */  0x1A, 0xD0, 0x87, 0x8E, 0x80, 0x9C, 0x00, 0x44,  // .......D
                /* 0968 */  0x40, 0x8E, 0x03, 0x44, 0xA5, 0xFB, 0x02, 0x62,  // @..D...b
                /* 0970 */  0x41, 0x40, 0x04, 0x64, 0x41, 0xAF, 0x11, 0x0D,  // A@.dA...
                /* 0978 */  0x9C, 0x80, 0x08, 0xC8, 0xD1, 0x8C, 0x01, 0xB1,  // ........
                /* 0980 */  0x9C, 0x20, 0x02, 0xFA, 0xFF, 0x1F, 0xA8, 0xBE,  // . ......
                /* 0988 */  0x22, 0x02, 0xB2, 0x52, 0x10, 0x0D, 0x9A, 0x00,  // "..R....
                /* 0990 */  0xD1, 0xB4, 0x40, 0x54, 0xF1, 0x9B, 0xE4, 0xD1,  // ..@T....
                /* 0998 */  0x81, 0x81, 0xE8, 0x88, 0x40, 0xA4, 0x1D, 0x11,  // ....@...
                /* 09A0 */  0x28, 0x88, 0x80, 0xFC, 0xFF, 0x07               // (.....
            })
            Method (SPEC, 1, Serialized)
            {
                Return (AMWV) /* \AMWV */
            }

            Method (DEVP, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, DVID)
                CreateDWordField (Arg0, 0x04, PARA)
                If ((PARA == One))
                {
                    Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_0 = DVID /* \AMW0.DEVP.DVID */
                    If ((_T_0 == 0x00010011))
                    {
                        \_SB.DSAF |= One
                    }
                    ElseIf ((_T_0 == 0x00010013))
                    {
                        \_SB.DSAF |= 0x02
                    }
                    ElseIf ((_T_0 == 0x00010023))
                    {
                        \_SB.DSAF |= 0x04
                    }
                    ElseIf ((_T_0 == 0x00060013))
                    {
                        \_SB.DSAF |= 0x08
                    }
                    ElseIf ((_T_0 == 0x00060015))
                    {
                        \_SB.DSAF |= 0x10
                    }
                    ElseIf ((_T_0 == 0x00010015))
                    {
                        \_SB.DSAF |= 0x20
                    }
                    ElseIf ((_T_0 == 0x00090011))
                    {
                        \_SB.DSAF |= 0x40
                    }
                    ElseIf ((_T_0 == 0x00070011))
                    {
                        \_SB.DSAF |= 0x80
                    }
                    ElseIf ((_T_0 == 0x00080013))
                    {
                        \_SB.DSAF |= 0x0100
                    }
                    ElseIf ((_T_0 == 0x00010019))
                    {
                        \_SB.DSAF |= 0x0200
                    }
                    ElseIf ((_T_0 == 0x00010017))
                    {
                        \_SB.DSAF |= 0x0400
                    }
                    ElseIf ((_T_0 == 0x00050011))
                    {
                        \_SB.DSAF |= 0x0800
                    }
                    ElseIf ((_T_0 == 0x00050012))
                    {
                        \_SB.DSAF |= 0x1000
                    }
                    ElseIf ((_T_0 == 0x00060017))
                    {
                        \_SB.DSAF |= 0x2000
                    }
                    ElseIf ((_T_0 == 0x00080021))
                    {
                        \_SB.DSAF |= 0x4000
                    }
                    ElseIf ((_T_0 == 0x00100011))
                    {
                        \_SB.DSAF |= 0x8000
                    }
                    ElseIf ((_T_0 == 0x00050001))
                    {
                        \_SB.DSAF |= 0x00010000
                    }
                    ElseIf ((_T_0 == 0x00120000))
                    {
                        \_SB.DSAF |= 0x00020000
                    }
                    ElseIf ((_T_0 == 0x00120021))
                    {
                        \_SB.DSAF |= 0x00040000
                    }
                    ElseIf ((_T_0 == 0x00120011))
                    {
                        \_SB.DSAF |= 0x00080000
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
                ElseIf ((PARA == Zero))
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_1 = DVID /* \AMW0.DEVP.DVID */
                    If ((_T_1 == 0x00010011))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFFE
                    }
                    ElseIf ((_T_1 == 0x00010013))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFFD
                    }
                    ElseIf ((_T_1 == 0x00010023))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFFB
                    }
                    ElseIf ((_T_1 == 0x00060013))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFF7
                    }
                    ElseIf ((_T_1 == 0x00060015))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFEF
                    }
                    ElseIf ((_T_1 == 0x00010015))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFDF
                    }
                    ElseIf ((_T_1 == 0x00090011))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFFBF
                    }
                    ElseIf ((_T_1 == 0x00070011))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFF7F
                    }
                    ElseIf ((_T_1 == 0x00080013))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFEFF
                    }
                    ElseIf ((_T_1 == 0x00010019))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFDFF
                    }
                    ElseIf ((_T_1 == 0x00010017))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFFBFF
                    }
                    ElseIf ((_T_1 == 0x00050011))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFF7FF
                    }
                    ElseIf ((_T_1 == 0x00050012))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFEFFF
                    }
                    ElseIf ((_T_1 == 0x00060017))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFDFFF
                    }
                    ElseIf ((_T_1 == 0x00080021))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFFBFFF
                    }
                    ElseIf ((_T_1 == 0x00100011))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFF7FFF
                    }
                    ElseIf ((_T_1 == 0x00050001))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFEFFFF
                    }
                    ElseIf ((_T_1 == 0x00120000))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFDFFFF
                    }
                    ElseIf ((_T_1 == 0x00120021))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFFBFFFF
                    }
                    ElseIf ((_T_1 == 0x00120011))
                    {
                        \_SB.DSAF &= 0xFFFFFFFFFFF7FFFF
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Return (One)
            }

            Method (SDSP, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, ACTN)
                Return (Zero)
            }

            Method (GDSP, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, ACTN)
                Return (Zero)
            }

            Method (DEVS, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, DVID)
                CreateDWordField (Arg0, 0x04, CPAR)
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = DVID /* \AMW0.DEVS.DVID */
                If ((_T_0 == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (DSTS, 1, Serialized)
            {
                CreateDWordField (Arg0, Zero, DVID)
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = DVID /* \AMW0.DSTS.DVID */
                If ((_T_0 == 0xA0000000))
                {
                    Local0 = One
                }
                ElseIf ((_T_0 == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Local0 = Zero
                }

                Local0 &= 0x0007FFFF
                Return (Local0)
            }

            Method (GPID, 0, Serialized)
            {
                Return (Zero)
            }

            Method (KBFT, 1, Serialized)
            {
                Return (Zero)
            }

            Method (HKEY, 0, Serialized)
            {
                Return (Zero)
            }

            Method (CFVS, 1, Serialized)
            {
            }

            Method (CFVG, 0, Serialized)
            {
            }
        }
    }

    Scope (_SB)
    {
        Name (RAMB, 0xBB70B018)
        OperationRegion (\RAMW, SystemMemory, RAMB, 0x00010000)
        Field (RAMW, ByteAcc, NoLock, Preserve)
        {
            DSAF,   256, 
            PAR0,   32, 
            PAR1,   32, 
            PAR2,   32, 
            PINX,   32, 
            PADD,   2048
        }

        Mutex (MPAR, 0x00)
        Name (ARBF, Buffer (0x10){})
        CreateDWordField (ARBF, Zero, REAX)
        CreateDWordField (ARBF, 0x04, REBX)
        CreateDWordField (ARBF, 0x08, RECX)
        CreateDWordField (ARBF, 0x0C, REDX)
        OperationRegion (IOB2, SystemIO, SMIP, 0x02)
        Field (IOB2, ByteAcc, NoLock, Preserve)
        {
            SMIC,   8, 
            SMIS,   8
        }

        Method (ISMI, 1, Serialized)
        {
            SMIC = Arg0
        }

        Method (GMSR, 1, Serialized)
        {
            If ((Acquire (MPAR, 0xFFFF) == Zero))
            {
                PINX = 0x80000000
                PAR0 = Arg0
                ISMI (0x90)
                RECX = Arg0
                REAX = PAR1 /* \_SB_.PAR1 */
                REDX = PAR2 /* \_SB_.PAR2 */
                Release (MPAR)
                Return (ARBF) /* \_SB_.ARBF */
            }

            Return (Ones)
        }

        Method (SMSR, 1, Serialized)
        {
            If ((Acquire (MPAR, 0xFFFF) == Zero))
            {
                CreateDWordField (Arg0, Zero, AEAX)
                CreateDWordField (Arg0, 0x04, AEBX)
                CreateDWordField (Arg0, 0x08, AECX)
                CreateDWordField (Arg0, 0x0C, AEDX)
                PINX = 0x80000001
                PAR0 = AECX /* \_SB_.SMSR.AECX */
                PAR1 = AEAX /* \_SB_.SMSR.AEAX */
                PAR2 = AEDX /* \_SB_.SMSR.AEDX */
                ISMI (0x90)
                Release (MPAR)
            }

            Return (Ones)
        }

        Method (PRID, 1, Serialized)
        {
            If ((Acquire (MPAR, 0xFFFF) == Zero))
            {
                PINX = 0x80000002
                PAR0 = Arg0
                ISMI (0x90)
                REAX = PAR1 /* \_SB_.PAR1 */
                REDX = PAR2 /* \_SB_.PAR2 */
                Release (MPAR)
                Return (ARBF) /* \_SB_.ARBF */
            }

            Return (Ones)
        }

        Method (GPRE, 1, Serialized)
        {
            PAR0 = Arg0
            PINX = 0x80000005
            ISMI (0x90)
            Return (PAR0) /* \_SB_.PAR0 */
        }

        Method (GNVS, 1, Serialized)
        {
            PAR0 = Arg0
            PINX = 0x80000003
            ISMI (0x90)
            Return (PAR1) /* \_SB_.PAR1 */
        }

        Method (SNVS, 2, Serialized)
        {
            PAR0 = Arg0
            PAR1 = Arg1
            PINX = 0x80000004
            ISMI (0x90)
        }

        Method (SARM, 1, Serialized)
        {
            If (((Arg0 > 0x03) && (Arg0 < 0x06)))
            {
                ISMI (0x92)
            }
        }

        Method (GAMM, 0, Serialized)
        {
            ISMI (0x91)
        }

        Method (SAMM, 0, Serialized)
        {
            ISMI (0x92)
        }
    }

    Device (_SB.PCI0.SBRG.TPM)
    {
        Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
        {
            If (TCMF){}
            Else
            {
                Return (0x0201D824)
            }
        }

        Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACCS,   8, 
            Offset (0x18), 
            TSTA,   8, 
            TBCA,   8, 
            Offset (0xF00), 
            TVID,   16, 
            TDID,   16
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((VIDT == 0x8086))
            {
                Return (Zero)
            }
            Else
            {
                If (TPMF)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.SBRG.TPM)
    {
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Return (Buffer (0x02)
                    {
                         0xFF, 0x01                                       // ..
                    })
                }
                ElseIf ((_T_0 == One))
                {
                    Return ("1.2")
                }
                ElseIf ((_T_0 == 0x02))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x12
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xF1))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }
                ElseIf ((_T_0 == 0x03))
                {
                    Name (PPI1, Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                    DAT = 0x11
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (One)
                    }

                    PPI1 [One] = DAT /* \_SB_.PCI0.SBRG.TPM_.DAT_ */
                    Return (PPI1) /* \_SB_.PCI0.SBRG.TPM_._DSM.PPI1 */
                }
                ElseIf ((_T_0 == 0x04))
                {
                    Return (TRST) /* \TRST */
                }
                ElseIf ((_T_0 == 0x05))
                {
                    Name (PPI2, Package (0x03)
                    {
                        Zero, 
                        Zero, 
                        Zero
                    })
                    DAT = 0x21
                    INQ = OFST /* \OFST */
                    PPI2 [One] = DAT /* \_SB_.PCI0.SBRG.TPM_.DAT_ */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    PPI2 [One] = DAT /* \_SB_.PCI0.SBRG.TPM_.DAT_ */
                    DAT = 0x31
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xFFF0))
                    {
                        PPI2 [0x02] = 0xFFFFFFF0
                    }
                    ElseIf ((DAT == 0xFFF1))
                    {
                        PPI2 [0x02] = 0xFFFFFFF1
                    }
                    Else
                    {
                        PPI2 [0x02] = DAT /* \_SB_.PCI0.SBRG.TPM_.DAT_ */
                    }

                    Return (PPI2) /* \_SB_.PCI0.SBRG.TPM_._DSM.PPI2 */
                }
                ElseIf ((_T_0 == 0x06))
                {
                    Return (0x03)
                }
                ElseIf ((_T_0 == 0x07))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x12
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xF1))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }
                ElseIf ((_T_0 == 0x08))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x43
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    Return (DAT) /* \_SB_.PCI0.SBRG.TPM_.DAT_ */
                }
                Else
                {
                }
            }
            ElseIf ((Arg0 == ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d")))
            {
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_1 = ToInteger (Arg2)
                If ((_T_1 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
                ElseIf ((_T_1 == One))
                {
                    TMF1 = 0x22
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    ToInteger (DerefOf (Arg3 [Zero]), TMF1) /* \TMF1 */
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    Return (Zero)
                }
                Else
                {
                }
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (ITPD, PCI_Config, 0xE8, 0x04)
        Field (ITPD, DWordAcc, NoLock, Preserve)
        {
                ,   15, 
            TPDI,   1
        }

        OperationRegion (TVID, SystemMemory, 0xFED40F00, 0x02)
        Field (TVID, WordAcc, NoLock, Preserve)
        {
            VIDT,   16
        }
    }

    Device (_SB.PCI0.ITPM)
    {
        Name (_HID, "INTC0102")  // _HID: Hardware ID
        Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        OperationRegion (TPMR, SystemMemory, 0xFED40000, 0x5000)
        Field (TPMR, AnyAcc, NoLock, Preserve)
        {
            ACC0,   8
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((ACC0 != 0xFF))
            {
                If ((VIDT == 0x8086))
                {
                    If (TPMF)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x7F                                             // .
                    })
                }
                ElseIf ((_T_0 == One))
                {
                    Return ("1.0")
                }
                ElseIf ((_T_0 == 0x02))
                {
                    ToInteger (DerefOf (Arg3 [Zero]), TMF2) /* \TMF2 */
                    TMF1 = 0x12
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    DAT = TMF2 /* \TMF2 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    Return (Zero)
                }
                ElseIf ((_T_0 == 0x03))
                {
                    Name (PPI1, Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                    DAT = 0x11
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (One)
                    }

                    PPI1 [One] = DAT /* \_SB_.PCI0.ITPM.DAT_ */
                    Return (PPI1) /* \_SB_.PCI0.ITPM._DSM.PPI1 */
                }
                ElseIf ((_T_0 == 0x04))
                {
                    Return (One)
                }
                ElseIf ((_T_0 == 0x05))
                {
                    Name (PPI2, Package (0x03)
                    {
                        Zero, 
                        Zero, 
                        Zero
                    })
                    DAT = 0x21
                    INQ = OFST /* \OFST */
                    PPI2 [One] = DAT /* \_SB_.PCI0.ITPM.DAT_ */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    PPI2 [One] = DAT /* \_SB_.PCI0.ITPM.DAT_ */
                    DAT = 0x31
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    If ((DAT == 0xFFF0))
                    {
                        PPI2 [0x02] = 0xFFFFFFF0
                    }
                    ElseIf ((DAT == 0xFFF1))
                    {
                        PPI2 [0x02] = 0xFFFFFFF1
                    }
                    Else
                    {
                        PPI2 [0x02] = DAT /* \_SB_.PCI0.ITPM.DAT_ */
                    }

                    Return (PPI2) /* \_SB_.PCI0.ITPM._DSM.PPI2 */
                }
                ElseIf ((_T_0 == 0x06))
                {
                    Return (Zero)
                }
                Else
                {
                }
            }
            ElseIf ((Arg0 == ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d")))
            {
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                _T_1 = ToInteger (Arg2)
                If ((_T_1 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
                ElseIf ((_T_1 == One))
                {
                    TMF1 = 0x22
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    ToInteger (DerefOf (Arg3 [Zero]), TMF1) /* \TMF1 */
                    DAT = TMF1 /* \TMF1 */
                    INQ = OFST /* \OFST */
                    If ((DAT == 0xFF))
                    {
                        Return (0x02)
                    }

                    Return (Zero)
                }
                Else
                {
                }
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x04, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            SPTS (Arg0)
            \_SB.PCI0.SBRG.IPTS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
            \_SB.SARM (Arg0)
            \_SB.PCI0.SBRG.SIOS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        SWAK (Arg0)
        \_SB.PCI0.NWAK (Arg0)
        \_SB.PCI0.SBRG.SIOW (Arg0)
    }
}

