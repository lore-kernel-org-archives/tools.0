Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646372
	for <tools@linux.kernel.org>; Thu,  1 Apr 2021 19:27:10 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id x14so3311282qki.10
        for <tools@linux.kernel.org>; Thu, 01 Apr 2021 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=dIvhMl2OxG3jiPVOd497rbEI0WfL5vBYWNyI1lTAOes=;
        b=UtWuoNtuebCW+AokWUTKpObVVdVREiBShClldCVT6AkKINNJomQKkdoXO0bx0WYuVp
         3DDV3sB/ivEgWNt4rX9u2izqzaCp6+3pwSmNQPR9i67EK+Wh1PuNwYttO9I9XEvTDD/t
         CF+RM716KY3486f9msoyrnzqCnWPNsODXXpzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=dIvhMl2OxG3jiPVOd497rbEI0WfL5vBYWNyI1lTAOes=;
        b=kkpfjGKy3PSrHMfme2UNPHXDexOXzXQ/cZvwqo7s13PpIsHyAjPvjGMeAll51Yoynu
         2RMcAJz3ZKzgVBrWvIreSROgaty1bvHUyRUJ3b0E7JpQFSof8hYWKbvKO2QDpUGZL7eC
         0fmg1QSm8MPQ/5MRYyidSoOWDZRzfWI+qP4A/CEiYcsp7CZcpioIgeynY/vWpy4aOumA
         Xib9/9iTXrWrScld42JiT+V7waAS6pXTkLOCTt1TH2zQJkFn7yRFAWsOx3WbiKucd5bD
         BtsBgsmydWM4dImZrAeXnDff03jfWcaqM6OCiACQcM5yhpb9pGQzziUNdpGo6aUrqInC
         2Etg==
X-Gm-Message-State: AOAM533rawERAheezpTdWj7lvQg3Dwmsog+O5Ijp/jrmHx2n6Fh1Zjzm
	p376UGT2RFzxmJX3CI2nu9doYB1/fJw63WjpR00=
X-Google-Smtp-Source: ABdhPJwjdHeXOjn2r5CmO6LXADmhuENCM1m4pr8DTWcRdTYngiTPJLk8gBOinOkZrzz1+zvIwJ8/7A==
X-Received: by 2002:a37:6592:: with SMTP id z140mr10165077qkb.464.1617305229290;
        Thu, 01 Apr 2021 12:27:09 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id u12sm4647043qkk.129.2021.04.01.12.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 12:27:08 -0700 (PDT)
Date: Thu, 1 Apr 2021 15:27:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: [sig-prover] random tarball signature verification script
Message-ID: <20210401192706.dlsv574jmhvszuq5@chatter.i7.local>
Mail-Followup-To: tools@linux.kernel.org, users@linux.kernel.org
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="olew3hqhtimh3kpi"
Content-Disposition: inline


--olew3hqhtimh3kpi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I resurrected one of my previously unreleased helper scripts that I used to
run to randomly check signatures on various kernel tarballs. It will do the
following:

- download a random tarball from one of the frontend servers
- download its corresponding signature
- check the signature against a pre-defined local keyring
- complain to an email address if verification fails

I rewrote it in Python-3 and I'm making it public just in case others feel an
inkling to run it on their own.

Here it is in action, with the default config:

	[latest]
	  retrieving https://www.kernel.org/releases.json
	  retrieving https://sjc.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.11.11.tar.sign
	  retrieving https://sjc.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.11.11.tar.xz
		uncompressing xz
		verifying with ./sig-prover-keyrings/kernel.gpg
	  signature is good and valid (created: 2021-03-30)
	--- sleeping 60 seconds ---
	[git]
	  retrieving https://ewr.edge.kernel.org/pub/software/scm/git/sha256sums.asc
		verifying with ./sig-prover-keyrings/dirsigner.gpg
		checksums signature is good and valid (created: 2021-03-30)
	  retrieving https://ewr.edge.kernel.org/pub/software/scm/git/git-2.14.5.tar.sign
	  retrieving https://ewr.edge.kernel.org/pub/software/scm/git/git-2.14.5.tar.xz
		uncompressing xz
		verifying with ./sig-prover-keyrings/git.gpg
	  signature is good and valid (created: 2018-10-05)
	--- sleeping 60 seconds ---

The config is also easy to modify to monitor any other subdir, not just kernel
and git -- so if you want to keep an eye on other tools you release on
kernel.org, you can run your own checker with your own keyring.

You can find the tool here:
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/sig-prover.py

(If you decide to run it, it's best to clone the entire repo so you get the
.conf and the default keyrings dir.)

Please report any problems to tools@linux.kernel.org.
As it's a pretty major rewrite, I expect it has bugs.

Regards,
-K

--olew3hqhtimh3kpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYGYeigAKCRC2xBzjVmSZ
bFG2AQChCKXWbOH5vM1lZZcoa/XjZF3vetpx25G3sRNumOnbegD+OhFP1FHxziCD
fnFmNEamoyGzmzil7RlnEU2KfWukXQ4=
=bf1i
-----END PGP SIGNATURE-----

--olew3hqhtimh3kpi--
