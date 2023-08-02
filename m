Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675F28824;
	Wed,  2 Aug 2023 14:57:49 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so10137206e87.3;
        Wed, 02 Aug 2023 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690988267; x=1691593067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ93l2TqgkSVRX2lg1/ZyCBWjTu9J/j4rAqP7YpTIAY=;
        b=U6CxtYGIsbRVp41JkNDe3gnHECMbBgOQbkAZWaf8aQfiklFuE4piYeYMfIZECTeQAK
         sjMaPl+wif5I2ldIhQvrQeWvMNz1YItP42dwfORYIiAOxMPgtrvHIxevS7qgSZO5Oiw3
         3/JjV60jsofyRHlHtxZKDVPk1JvGakS9SXMMkAd56sRrSM7osaP3iMb+8bXcl1fRGF+H
         PXwuOIXxtnaN1oo55LJ5Oht2vguw0WMGuG4miD7fn6DBEkKY7ZaewSljTEjBGhAqb08E
         HHiWGQKSvL0GAogS7wxYIptbCKZZVgvK9UxxnM74CVv4PHWbaIfNSkAri7z+RYcSozEE
         CeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988267; x=1691593067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQ93l2TqgkSVRX2lg1/ZyCBWjTu9J/j4rAqP7YpTIAY=;
        b=CJH74fsXPV5LktBxyTGpFb5alr8l1d+vTcpYehld55JDRNX5qOzkvKdQZQUpUNGJPm
         4BHfW0T0zX6ey8XOfcoGZJt7FSP3xYU4JWLnG6GIbtfCYnGLnvsqSeFMm98C02rVjcp2
         vy17j9UNqgcrsviNVHsQ/Hg00YGvuMV4aRyvFRRDYbrhPXU7ReV3EnJiP9hoooip0+L4
         cVaILFIbm9qpgiFjS5UDwtARBrtWGb2hW/rl4m43VyHrTJnbGMBBrIui05pc1VY0AEp5
         bk/08rg3lACn54iBeY7yZGmwEt75nDfCbo8gl2LDJv3c8J8hNskQmmOFpLjQnnTxgkRS
         KkLg==
X-Gm-Message-State: ABy/qLaWjhlbZMDE7Os8CFvEyCN2WFwcVOWHiHIVhL6e6Se4hJ8OpWYm
	UcoyZ/Yv8i6RIqcFI50g3qfBP3C7GRifLZN3zyHv5ZlkXzE=
X-Google-Smtp-Source: APBJJlF9sQHJ8IwGWra6hCVMifCTvIolQIud+rb5XK2wLQMJcF5nAFyAKf60h+23UTWQ5icSd1MqY1gs5FiHr1Gem/w=
X-Received: by 2002:a05:6512:3495:b0:4fd:f7fe:c3e with SMTP id
 v21-20020a056512349500b004fdf7fe0c3emr4043242lfr.67.1690988266805; Wed, 02
 Aug 2023 07:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAFMMQGt=-0HRpmb+fD0e_LVeZ_TPr-8QEPnorAkffrVOowb4dQ@mail.gmail.com>
 <20230802-failing-cheer-6f381c@meerkat>
In-Reply-To: <20230802-failing-cheer-6f381c@meerkat>
From: Chuck Lever <chucklever@gmail.com>
Date: Wed, 2 Aug 2023 10:57:35 -0400
Message-ID: <CAFMMQGs6Mt-19JJCOtSPDicONDBOEf5jw2yrixv6PZruPRUiPA@mail.gmail.com>
Subject: Re: Most of my "b4 am" runs fail the DKIM test
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 10:11=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Aug 02, 2023 at 09:53:10AM -0400, Chuck Lever wrote:
> > I recently started seeing this quite a bit:
> >
> >   =E2=9C=97 [PATCH v4 1/2] SUNRPC: add verbose parameter to __svc_print=
_addr()
> >   =E2=9C=97 [PATCH v4 2/2] NFSD: add rpc_status entry in nfsd debug fil=
esystem
> >   ---
> >   =E2=9C=97 BADSIG: DKIM/kernel.org
> >
> > In fact, even my own patches (sent via the kernel.org SMTP relay) fail
> > this check.
> >
> > What am I doing wrong?
>
> It's really hard to troubleshoot, but you can try the following:
>
>     $ curl -s https://lore.kernel.org/linux-nfs/5b0eff4e3ef9bf9621f509518=
9933f60def40f0d.1690569488.git.lorenzo@kernel.org/raw | dkimverify
>     signature ok
>
> If you don't get "signature ok", then my guess would be that there's some
> problem performing DNS lookups for public keys.

curl -s https://lore.kernel.org/linux-nfs/5b0eff4e3ef9bf9621f5095189933f60d=
ef40f0d.1690569488.git.lorenzo@kernel.org/raw
| dkimverify
signature verification failed

A DNS issue makes some sense; I've made some DNS/firewall changes here rece=
ntly.


--=20
"We cannot take our next breath without the exhale."
 -- Ellen Scott Grable
