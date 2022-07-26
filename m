Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B48B2590
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 14:37:12 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id a9so10534227qtw.10
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WHCSQs8JZFCAZDg0etKGf4MtMfRgdgQ+zfWq4ATWPL0=;
        b=Vqh881gpRfHwijwdKpMjAuvacsWtGqVgN+k51c32LmvXxSN6Vd/CW4nHajN57vnnjR
         ZuV5zzhBaBrJTne5kiZIB9BiJCC3/vdkaSbBTjBQEF8X55mWbHrE1SDxJascAy1cUplB
         1rvJRhvXec482qA0ootQTwfbMRE1k52GMEzAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WHCSQs8JZFCAZDg0etKGf4MtMfRgdgQ+zfWq4ATWPL0=;
        b=yMNVwWBKG04rZBdCDT8zVldQI7oFqaXr/fK/y2E0+rDGEU4X0mVSZcY1pPEGMlpwr/
         rDhiBueFI4G9kYJkoSXAJCtrSExcBYA12hOmn1ojfsyYxI498vdn3BbWyjwHHrjWjoTX
         7/eaprULyZiFKiZId0M/tD991Lu0BdkcTfWP1M2DNoVIHeyxKTYhNKGkKiffcp43CU5B
         e6724qLYj7TXdM72UDynldKqQ1WdWAytQgNM0DbaxODel5id/ZGjpz0NLrtbI6LVdGH4
         5gtmg2p1wuwHdIRCdiCm5vQxAcD/4kj6y5XsXouNMYLfgpX+0sYYjLrET1Zz30YkKvi/
         SQzw==
X-Gm-Message-State: AJIora8z2Qrx0+swJ2Zc2g1X+PwggeFXeH6pQAbCgEak2JOScpyR8YFo
	o8XwCdgpW74jM4TpzxZNjA+4gVNEYhyfNQ==
X-Google-Smtp-Source: AGRyM1v1elJO9hTAvQgP1VzATBLw6IudY48zy6ZdVtsAuZaX42DonjUcGBMlbQs/4z8JRT8YESddjQ==
X-Received: by 2002:ac8:5bcf:0:b0:31e:f981:184a with SMTP id b15-20020ac85bcf000000b0031ef981184amr14527002qtb.653.1658846231326;
        Tue, 26 Jul 2022 07:37:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id d21-20020ac85ad5000000b0031ea1ad6c5asm9767526qtd.75.2022.07.26.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:37:10 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:37:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220726143709.tipfxgptm3rfrb5r@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87k08010k4.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k08010k4.fsf@baylibre.com>

On Tue, Jul 26, 2022 at 03:11:07PM +0200, Mattijs Korpershoek wrote:
> I would like to file another bug around b4 ez-send --dry-run.
> When using the --dry-run option, the To: section is not shown for all
> patches. In fact, we only see the To: section on the cover letter email.

Yeah, this is a bug I added recently.
I'll fix it this afternoon after I'm done rebooting the world.

> ## prepare branch/work
> $ b4 ez-series -n dry-run -f next-20220725
> $ b4 ez-series --edit-cover # to remove EDITME and be able to use --dry-run/-o
> 
> ## make an edit on a file which is maintained by Matthias Brugger
> $ vim drivers/soc/mediatek/mt8167-mmsys.h # make some change
> $ git add drivers/soc/mediatek/mt8167-mmsys.h && git commit -s -m "Example change for mt8167-mmsys.h"
> $ ./scripts/get_maintainer.pl --m drivers/soc/mediatek/mt8167-mmsys.h
> Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
> [...]
> 
> ## show dry run
> $ b4 ez-send --dry-run --no-sign
> 
> ## show output in .patch files
> $ mkdir dry-run
> $ b4 ez-send --no-sign -o dry-run
> $ vim dry-run/0001-example-change-for-mt8167-mmsys-h.patch
> 
> Is this the expected behaviour?
> To me, -o and --dry-run should produce as close as possible results.

When we use "-o" we operate in the git-format-patch compatibility mode, which
doesn't collect to/cc addresses (this is done at the git-send-email stage).
Perhaps this should be split into two different commands

instead of:

    b4 send --output-dir OUTPUT_DIR

do:

    b4 prep --format-patch OUTPUT_DIR
    b4 send --dry-run [-o OUTPUT_DIR]

and then fix "b4 send -o" to output the same thing as --dry-run, but into
files as opposed to stdout, complete with all the headers as they will be
sent.

I'll implement this change this afternoon.

-K
