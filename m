Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46B367;
	Sat, 22 Jul 2023 22:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ACCC433CB;
	Sat, 22 Jul 2023 22:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690065257;
	bh=A+bQPxqhUa7SyW//Y2fYxSVMpEOw6HHTZ9shb9ULcIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qPJU5ViKLF9OlgiGyOndmJItucm7hj05vhFAc6tUs7MMGIRPckg+iiL9PoUfxeo1+
	 /DbFkSP+tDRPklrH3grfp31oFscyEj5aAcJ5i3KaW/QMb/Anf9NCmaELogYKP8dBri
	 oHGGqj7INtxlXNdvruLu8JcS6Ndf6SBooSxCjaZMuXUZ+xzAwWy04HIpCMHXejUufp
	 XRDMPhIi06NUL1uQZwdLMC9hUUhX8piWF4jNPBVKI44XPxraiJfWTXZSxkbbBDpYGR
	 VrQwXLFcI0N/feI2GU8rOf82mPB1eDOuDj+wDwbY0QCyslWoZk82FZwyUgDaIdJ4Eq
	 3MyLZGPrQZxVQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b7441bfa9eso39670861fa.0;
        Sat, 22 Jul 2023 15:34:17 -0700 (PDT)
X-Gm-Message-State: ABy/qLYEbAZdH219LsgWIAeESysk8C5ea+9Sb7+jSJ/ayk3gUWPgLb58
	KVZMNg9sCa6Bdkvl/RPW+0MFWK83MraN0KzLtQ==
X-Google-Smtp-Source: APBJJlHu572QsDNXZrZBxErV3zxA0lANiFwXvMQaLH4v7ERBsYoZcYQp1K+SM8PuQ50yIY5WpVGuRMmUHTu/SRayQ78=
X-Received: by 2002:a2e:3018:0:b0:2b5:8b02:1000 with SMTP id
 w24-20020a2e3018000000b002b58b021000mr2206024ljw.8.1690065255090; Sat, 22 Jul
 2023 15:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
In-Reply-To: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
From: Rob Herring <robh@kernel.org>
Date: Sat, 22 Jul 2023 16:34:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLW4rs5AqCg+Ghxeb7+Ge3tnu7JQpA85HxrTX-1DZQH_A@mail.gmail.com>
Message-ID: <CAL_JsqLW4rs5AqCg+Ghxeb7+Ge3tnu7JQpA85HxrTX-1DZQH_A@mail.gmail.com>
Subject: Re: Fetching an mbox from lore
To: Maxime Ripard <mripard@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2023 at 11:13=E2=80=AFAM Maxime Ripard <mripard@redhat.com>=
 wrote:
>
> Hi,
>
> I've been trying to fetch an mbox from lore with an arbitrary search requ=
est.

Any reason you aren't just using lei? This is my script to get such an
mbox and open it in mutt.

8<-----------------------------------------------------
#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only

usage()
{
        echo "syntax: `basename $0` [-t] <query string>"
        echo ""
        echo "For query syntax, see https://lore.kernel.org/all/_/text/help=
/"
        exit 1
}

while getopts "ht" opt
do
        case "$opt" in
        t)      threads=3D"-t";;
        [h?])    usage;;
        esac
done
shift $((OPTIND-1))
query_str=3D"$*"
[ -z "$query_str" ] && usage


tmp_mbox=3D$(mktemp)

echo "$query_str" NOT tc:stable@vger.kernel.org | \
  lei q --no-save --dedupe=3Dmid $threads -f mboxrd -O
https://lore.kernel.org/all/ -o $tmp_mbox --stdin

if [ -s "$tmp_mbox" ]; then
        mutt -f $tmp_mbox
fi

rm $tmp_mbox
