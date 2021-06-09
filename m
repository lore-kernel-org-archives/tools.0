Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E468C2FB5
	for <tools@linux.kernel.org>; Wed,  9 Jun 2021 19:21:39 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id x2so12769269qvo.8
        for <tools@linux.kernel.org>; Wed, 09 Jun 2021 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=5shl6cJFLQJPTbxswGMo0H+1yWxnBxxbTUnEnNlY0M0=;
        b=b+bE6mlZKaY7WC2Qf6oEZxG2JZXNnHTwvQ0x2J02YAnxDH63LjWSkhTWH8nmHNKHZ3
         lpmHCbRbz2Quv8iyg8oVTri1uFUHqUfwQ1R3tdTvo+sn3ZXLq6yg2Y9D2ag0hqusva14
         ibaPcNXPuoQ00QKBtzhhDXV7/Za9bFnCsn9j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=5shl6cJFLQJPTbxswGMo0H+1yWxnBxxbTUnEnNlY0M0=;
        b=qWUoqwXfTXCeIuOIom4rBhQtEJFkP+8egtzJzLsY+nayyWhiUb7gaHd5gEG5cmq0re
         5C/rTO/C2gsjkaZKV4KRqbpUjeglvaxXVYtx40OQ4dPTYsPAZFOSR7r0kSvMaBw7LNbH
         50EmhEa3YdUCd1yCx58PbAqqabypsbSOSf+nLljlzb/ghPCwVQiKeEBFeNJbzhgUc/zb
         oLTcc/sYp69Nqfiqpt175D06AOj36SAlfrnB0S80G4mpf2accB7F0PR/HyZhP0xyR8QJ
         QklFUxc2q34ufL0XxnD0N9QzCLSJAp8cVwQvo4Ax01k4EHqp8OW9jTyYUWs+8nSRJGe9
         1AIQ==
X-Gm-Message-State: AOAM5332VtjNbEnBqZ45CxFQFxN0Bj+rDkmChzBXzcj8T4EkrI0N/iKd
	Agn7Q1Zw9O5xbp+f4XK6AJ3V0Xl3Gxw2Hury
X-Google-Smtp-Source: ABdhPJzsYkRk8JcwT49EPmN0AUoFhNZUfr0X+YE/CG6R1YdHbZMa1dLVIVKkPLubmzfA3ZdrAdYpqQ==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr1614223qvi.44.1623266498671;
        Wed, 09 Jun 2021 12:21:38 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y18sm614755qtx.6.2021.06.09.12.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 12:21:38 -0700 (PDT)
Date: Wed, 9 Jun 2021 15:21:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 v0.7.2 released
Message-ID: <20210609192136.svadnx42in2ldq2s@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ycew7nuqdfl5fdey"
Content-Disposition: inline


--ycew7nuqdfl5fdey
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

B4 version 0.7.2 is now available. This is a bugfix release that corrects a
couple of crashers:

- fixes a crash when running "b4 pr" against an unsigned remote
- fixes a crash when running "b4 am" with --sloppy-trailers
- fixes a formatting problem when reconstituting a partial reroll

To upgrade, run:

    pip install --upgrade b4 patatt

Or "git pull" + "git submodule update" in the checkout.

Best regards,
-K

--ycew7nuqdfl5fdey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYMEUwAAKCRC2xBzjVmSZ
bIq2AP47DyiaiN0FLQrPttDjSViVqLbY7fjcSJJGst038b821wD9E7020LelaZpW
HpgIP5cFiwfXXwCvVWwOH0qqi9YdLwU=
=H/W6
-----END PGP SIGNATURE-----

--ycew7nuqdfl5fdey--
