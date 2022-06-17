Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC433C7
	for <tools@linux.kernel.org>; Fri, 17 Jun 2022 17:37:29 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id o43so7444337qvo.4
        for <tools@linux.kernel.org>; Fri, 17 Jun 2022 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=l1y2oRQGip+TM934p23BGoNA4mJppDbihMwEFl4lRE4=;
        b=I8ubG3oxv/whFkM/Tte03jZHEssMpYlsPMT050BjdXgB1w+SZtq1Z2md1Wku/fxI4L
         XHhYSXKP3Wh+tnZqvWJI/aagsbZ/L/UiljM6uzD9hNo64mKr1CIZzjLu01xlBv+TFbeE
         uQR/P6776k39fflHGSRUsEFpjtKzxo4K7PkU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=l1y2oRQGip+TM934p23BGoNA4mJppDbihMwEFl4lRE4=;
        b=WKfDFvXG44Wfcc07/4UWcmkjeky0syra+mp1HMcgsrgPiP5zG8mm9LQUPA8eSK3Rxs
         iDSt+kmqazXtsbsfkA1Il8QSkCZd/oQMd02qiCj71y7KQE+ldeLp/NUnKF0SR7IpGl1Z
         I3xydUMWzl4S8EFM8+1Uz7c55AvgF4KtByW26QN+vb/tWliD3KK3feyDCDkwCWs6ycoB
         htSX1rJTRttBapHx/5b+6y/CUaRG1ZpopqF0PNuupnQemG1h7v5IlteOWN+ykvOKTIkx
         9rIbbCLWjqS9Hu04IKLu/t0A0xlAyZeiq7N70Y40x0suASd26axdZ8PR2FE/A7rfObYt
         OqBg==
X-Gm-Message-State: AJIora+WMREDkN32LlU2HR9VfJPOmJj4C3bHshWPG9bykc7mO3i1j7Ys
	7W4arOaGhqfYkKbg2zfaV3uCLpG4KqjWxw==
X-Google-Smtp-Source: AGRyM1sAHTaY7jkiQa+KQHIs0kAMXQrtsVh+pLpGcGBucLILAXAakuuDgCW+50FXOqughsfsBXnO0A==
X-Received: by 2002:ac8:5f8f:0:b0:304:e15b:8dcc with SMTP id j15-20020ac85f8f000000b00304e15b8dccmr9662899qta.38.1655487448118;
        Fri, 17 Jun 2022 10:37:28 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id b2-20020ac844c2000000b00307c8f028a2sm2180304qto.86.2022.06.17.10.37.27
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:37:27 -0700 (PDT)
Date: Fri, 17 Jun 2022 13:37:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: patatt-0.5.0 available
Message-ID: <20220617173726.xfy5idgplnrq5hob@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ql4qx3kbqlgku3w2"
Content-Disposition: inline


--ql4qx3kbqlgku3w2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

Patatt version 0.5.0 is available. The main features in this release are:

- support openssh signatures (requires openssh version 8.0+)
- set new return code for absent signature (RES_NOSIG)
- always set the identity (i=) field in the signature header to support
  SMTP mailforwarder operations that must rewrite the From: header

If you're using patatt from pip, you can upgrade using:

    pip install --upgrade patatt

Special thanks to the following people who have contributed to this release:

- Anuradha Weeraman <anuradha@debian.org>
- Kees Cook <keescook@chromium.org>
- Nick Desaulniers <ndesaulniers@google.com>

Best regards,
Konstantin

--ql4qx3kbqlgku3w2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYqy71gAKCRC2xBzjVmSZ
bKVIAQCDvtKtbczU2yebBJ+e0IXdjxxfhABIrAdmhdCPeE2QYAD9FyFylQ4IUT/6
AGL6W0wkm1vyBrgMsUzTRHLlrmCY4gk=
=wleH
-----END PGP SIGNATURE-----

--ql4qx3kbqlgku3w2--
