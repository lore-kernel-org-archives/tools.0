Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.76191.1584384397766231865
 for <tools@linux.kernel.org>;
 Mon, 16 Mar 2020 11:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NrA735b2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.175, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f175.google.com with SMTP id z8so11782656qto.12
        for <tools@linux.kernel.org>; Mon, 16 Mar 2020 11:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=0KZgAhl5UTZpgXSzk5QSua1ZJ2gSTRLBfFgPbCNOuec=;
        b=NrA735b2U17MS6BMnpw2H9jTL5GHsRZpV4/sJCISAdV1BgYKtrbyXPy4bgQJeFxcVM
         s4zOOJycip7OA+gfU08ewh19n5iAumvqlItAIaPAcCuqFy8MD9pPhYetG8asdzBrl69T
         UBLfv56mkdqdTifMj1wVg3KuwODJI8j83ERPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=0KZgAhl5UTZpgXSzk5QSua1ZJ2gSTRLBfFgPbCNOuec=;
        b=pNCGJPAbEtQENWryLaA5nbvcswrSReq9/T6pbm2EVl9CLgmD3SGt2p1kT8hr8aL4MJ
         U8wSsMsE1uAMWtDFn5zuhSm4f+rjmYwB5xqtYHo3r/RxFgr0qobfegdjwKj3HwdwLWsf
         yHAmMTzNz0D/HFGEbGfA6x7i5hXm/z7aqq1EsAmDPnZ9+4FxbdKp2YnV/F8UkyBJ8tui
         aCv2jhH3UOwbQLUn5fPg7jJWnP5OWW9hyF6TQ78/ep0DgHXidkRQL8Rd61qlpwyNtqoo
         dgbBPqY6UGUCES+RTmJ2Bk8vM8d++K+0SD8K+tM5lSuQJOXL0al3piLEVgKzL5FQDACN
         lMfQ==
X-Gm-Message-State: ANhLgQ2cpydMgHb2WCNvH6NHH94tRf23hd+cWcfH0IIsJTZXgRzJvmQt
	MFChM5zrNYGJnQUYa54X/VVhkg==
X-Google-Smtp-Source: ADFU+vtXWiQ5JmLVZ/WC+5wWOqSxfQp2ufSLb9CojrSS0FTazFQ0l5MNaB+BjaoJ+VtvZmUVrmiKkQ==
X-Received: by 2002:ac8:fcf:: with SMTP id f15mr1505980qtk.233.1584384396767;
        Mon, 16 Mar 2020 11:46:36 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id z19sm364078qts.86.2020.03.16.11.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 11:46:35 -0700 (PDT)
Date: Mon, 16 Mar 2020 14:46:34 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: get-lore-inbox is now b4
Message-ID: <20200316184634.numlsrehaliaixkp@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 1
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ecvige7p5pmsubkh"
Content-Disposition: inline

--ecvige7p5pmsubkh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all:

While working on patch attestation stuff, it became clear to me that it=20
would be much easier if get-lore-mbox was an actual python project=20
instead of a standalone script. As a bonus, such change would also make=20
the tool easier to install, upgrade and package. So, say goodbye to=20
get-lore-mbox and say hello to b4.

Installing:

  python3 -m pip install --user b4

Upgrading:

  python3 -m pip install --user --upgrade b4

(Just using "pip" instead of "python3 -m pip" will probably work, too.)

If your ~/.local/bin is not in your PATH yet, you can either set a=20
symlink to b4 there from your usual PATH, use an alias, or add=20
~/.local/bin to your path.

At version 0.3.1, b4 is pretty much get-lore-mbox version 0.2.16 plus=20
the "Fixes" tweak from this morning (and plus the whole attestation=20
stuff). =20

You will notice that b4 is very much flag-compatible with get-lore-mbox:

old:

  get-lore-mbox -a [msgid] [flags]

new:

  b4 am [msgid] [same flags]

You can easily see all flags by running:

  b4 am --help

The biggest visual change for you would become obvious if you're=20
grabbing patches that provide attestation, e.g.:

---
$ b4 am -o/tmp 20200313231252.64999-1-keescook@chromium.org
Looking up https://lore.kernel.org/r/20200313231252.64999-1-keescook@chromi=
um.org
Grabbing thread from lore.kernel.org
Analyzing 3 messages in the thread
---
Writing /tmp/v2_20200313_keescook_chromium_org.mbx
  [=E2=9C=93] [PATCH v2 1/2] selftests/harness: Move test child waiting log=
ic
  [=E2=9C=93] [PATCH v2 2/2] selftests/harness: Handle timeouts cleanly
  ---
  [=E2=9C=93] Attestation-by: Kees Cook <keescook@chromium.org> (pgp: 8972F=
4DFDC6DC026)
---
Total patches: 2
---
Cover: /tmp/v2_20200313_keescook_chromium_org.cover
 Link: https://lore.kernel.org/r/20200313231252.64999-1-keescook@chromium.o=
rg
 Base: not found, sorry
       git checkout -b v2_20200313_keescook_chromium_org master
       git am /tmp/v2_20200313_keescook_chromium_org.mbx
---

Attestation is still an experimental feature, so if you find that it=20
breaks something for you, you can turn it off entirely by adding the=20
following to your ~/.gitconfig:

[b4]
  attestation-policy =3D off

The default policy is "check", which will look for an attestation=20
document but will not give any warnings if it doesn't find anything.

If you are interested in playing with patch attestation, it is very easy=20
to get started:

1. find a bunch of patches you sent off recently, preferably those=20
   prepared by "git-format-patch"
2. run "b4 attest *.patch"

This will submit the attestation message to mail.kernel.org:587. If it=20
is unable to do so, it will write the attestation message out into
cwd. See more options with: b4 attest --help.

Finally, there's a new mailing list for discussing b4 and similar=20
utilities:

tools@linux.kernel.org

Please send future bug reports or other problems there instead of to=20
users@ (though you're welcome to do both).

Best regards,
Konstantin

--ecvige7p5pmsubkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXm/JiAAKCRC2xBzjVmSZ
bH2aAQDPxvpZEctzhwR+LSUo+zj1no2TPfu3kf6B9Ifeov+QnAEA3w928ct0mbA1
nP+bYFRxZrykBYxBWOKmROLwBfj78gA=
=PKnv
-----END PGP SIGNATURE-----

--ecvige7p5pmsubkh--
