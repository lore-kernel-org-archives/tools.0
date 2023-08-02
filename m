Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75479CF;
	Wed,  2 Aug 2023 13:53:24 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9f48b6796so38212531fa.3;
        Wed, 02 Aug 2023 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690984402; x=1691589202;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2tdq5unLUHfqytgeLDysQPslRiRNIboMaKu0ybniGtQ=;
        b=myuNZNGwE3GaDuDrXmi6xJse/DWtVnUMJYj1rnFqaxnK+lcSkIczxahGCERFuP4ohV
         drndJI7JL4Tvm/WtlFS6Wd8RyqvZ7BZ0s2dEkfzQ7j0XGvMINmlKRMD+iaysNfMiIWeN
         QXganT+pVIU88/iG6vr2BRs6iNMpIK5G2dAPHqi/l/reBl8g7ZCYpY90yh0Dz2nXxwUr
         8RZ/oFOS03NnHPJvH/PB3ASjdHpTdXaRGYCPW8hZjRgDNALt05N1GI3a5OS0ZmMB0JCU
         n+J/71nFS4aDjvB4jzBTR+6deT0IYlqhtQbTV4mC0p9bC3nzxEZAkp0k4MLaqtH291aJ
         LquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690984402; x=1691589202;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tdq5unLUHfqytgeLDysQPslRiRNIboMaKu0ybniGtQ=;
        b=QMn2gP1j/rJyAMLceb879CCoOODk2UZyZy4/cYq7GnW1bCzMC9dWv5cqW0rxjT7wus
         xOT29GLMEvCqeEzvDucNCBJDpwHBX5HA18Qp1XlUrTpBA1VeieKoWQiUR7GGA76zc0Ea
         VOuAv3axJTl2JhYbl6P06eS2czfD+qzwy9ofvyWb8qslUzpnPR9sGoUFu201fBdJ9vM8
         hXP13JkmCLow+zQJTpfyXQAr14P7487E4LPxPdWQTEWv4wLiyE3kn5CMThEpPdRWnfWG
         27gC8o9XdoJScp5Hrw+VSAjtkb98kQUmX+32fXZbWCQsFOtGs2YHr+GLZBx5GQhFVj22
         Z1vA==
X-Gm-Message-State: ABy/qLay/JEQdBukWuvkadJRwGJd27tU8Iyxmo01Vab+zv7QWt0jrRKH
	9W60w98e+aVdF3T7QnyVkws+vijq2ezEcJMCyfRq+BpZZo4=
X-Google-Smtp-Source: APBJJlGyfFYjJAJnMWgwikkhNUyjT0lbacUckMF76QjpNdafDY6Yg7DUVqCEg5EUqPu9kGoegPfdItSvB2AhhrBDVSA=
X-Received: by 2002:a2e:3e07:0:b0:2b9:dd5d:5d0c with SMTP id
 l7-20020a2e3e07000000b002b9dd5d5d0cmr4400327lja.52.1690984402179; Wed, 02 Aug
 2023 06:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Chuck Lever <chucklever@gmail.com>
Date: Wed, 2 Aug 2023 09:53:10 -0400
Message-ID: <CAFMMQGt=-0HRpmb+fD0e_LVeZ_TPr-8QEPnorAkffrVOowb4dQ@mail.gmail.com>
Subject: Most of my "b4 am" runs fail the DKIM test
To: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I recently started seeing this quite a bit:

  =E2=9C=97 [PATCH v4 1/2] SUNRPC: add verbose parameter to __svc_print_add=
r()
  =E2=9C=97 [PATCH v4 2/2] NFSD: add rpc_status entry in nfsd debug filesys=
tem
  ---
  =E2=9C=97 BADSIG: DKIM/kernel.org

In fact, even my own patches (sent via the kernel.org SMTP relay) fail
this check.

What am I doing wrong?


--=20
"We cannot take our next breath without the exhale."
 -- Ellen Scott Grable
