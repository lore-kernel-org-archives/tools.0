Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3149455
	for <tools@linux.kernel.org>; Thu, 30 Mar 2023 20:25:36 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id x15so18402366pjk.2
        for <tools@linux.kernel.org>; Thu, 30 Mar 2023 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680207936;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qINjvZ67EHsPpbJYTw8MG7xu+/Ab5/gB9Dg/vXWRIg=;
        b=pDekvs7Kh3vJPE4E9B+YVcugfYuHedYGzkcYJlik1ewxBo9k7hadE6Modo6MGIC2gu
         pTBojLrQtMb4mHnQm6MMh6EXlkmlDzex5TXQMQQ3/a54ApY2NmGiYhI9qv9/lmhbQxW/
         9RLb5ugrK7bi7L1fBxk2d9Zl4sOhBM/FpYctAxy+5wTM+TLM9fbJg4xf3kYK0y9CDxk6
         txvMPOW32x7N4UbDlUpTU5NibBTj5Fdy0dMryGWMU2sUtN5V0K/t1G3LABxK8s5unooQ
         MSzFUgRY+XANYiPPddkm+YiOHkVE1grUyf5/1a36TTnb/+iBqBN86ApFKVrKITkPZ7UL
         KeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680207936;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qINjvZ67EHsPpbJYTw8MG7xu+/Ab5/gB9Dg/vXWRIg=;
        b=Kuuq72UWks4ou3sPQ/Ye5HddLT6z0la3S1wEk5iHJkLNFZca5IAQqcMBElGyvsfSvF
         hOOLtBOXqvnaiRYA+IRl0liWO1CSWhXLlhCpa7kV4oYugZ3Lt8tniM8s3gWZ7ozT2d/F
         of8Zl7qxPA9rBFSBVoLzt9GCHftNZRuexOATUaxi15jjfijlOhWQrSMQNv58r6ZrrjhH
         hgIP1V42YT+VrnLph49sULTzHerqq2Vt+CFceXrJKHVdWvv1fuKqHFxIaYBHHpk2x1A9
         gXettKlcCbqc0D2f2zNxH/iKMwlESCphkp0X+QjVR5zLdDaRy8YP4wgXIqm754XgavTE
         LqhA==
X-Gm-Message-State: AO0yUKUGe965cGvqMCR2/oyTtETNAlzC8OpoIfRg53qrLc6IzqmyIGNA
	1dIUcMRJuvr/QXmbLGTvK1v8m5nTqin6kBfY5lw=
X-Google-Smtp-Source: AK7set+59d3XsSXLZ2xMFjS/UWXdGvLGwWBRa+YKPBx8hsCBHmiJ4swkx4Xu3zAgUbzLlAhlYPpwQQ==
X-Received: by 2002:a05:6a20:65a9:b0:da:a6ef:5344 with SMTP id p41-20020a056a2065a900b000daa6ef5344mr21113612pzh.21.1680207936042;
        Thu, 30 Mar 2023 13:25:36 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e1-20020a6558c1000000b00513a9b29634sm222898pgu.27.2023.03.30.13.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:25:35 -0700 (PDT)
Date: Thu, 30 Mar 2023 13:25:35 -0700 (PDT)
X-Google-Original-Date: Thu, 30 Mar 2023 13:25:32 PDT (-0700)
Subject:     Re: [PATCH] shazam: warn when overriding base-commit with --merge-base
In-Reply-To: <20230330110909.355701-1-conor.dooley@microchip.com>
CC: tools@linux.kernel.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-05456346-ddcc-4c08-8b7f-8eee5543c553@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 30 Mar 2023 04:09:10 PDT (-0700), Conor Dooley wrote:
> If the --merge-base argument is provided, base-commit information that
> was provided by the submitter is ignored. This behaviour is intentional,
> but warning the user that this has happened (and what the intended base
> was) is helpful.
>
> To be able to do this, base-commit can't be set from mergebase until
> after parsing the submission and attempting to guess it.
>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This should be a valid test:
> b4 shazam -H --merge-base v6.3-rc1 20230330064321.1008373-2-jeeheng.sia@starfivetech.com
>
> I wasn't 100% sure if it should go before or after the base commit
> guessing code.
> ---
>  b4/mbox.py | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/b4/mbox.py b/b4/mbox.py
> index 7060564..a983092 100644
> --- a/b4/mbox.py
> +++ b/b4/mbox.py
> @@ -211,24 +211,22 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
>          logger.critical(' Link: %s', linkurl)
>
>      base_commit = None
> -    if cmdargs.mergebase:
> -        base_commit = cmdargs.mergebase
> +
> +    matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
> +    if matches:
> +        base_commit = matches.groups()[0]
>      else:
> -        matches = re.search(r'base-commit: .*?([\da-f]+)', first_body, re.MULTILINE)
> +        # Try a more relaxed search
> +        matches = re.search(r'based on .*?([\da-f]{40})', first_body, re.MULTILINE)
>          if matches:
>              base_commit = matches.groups()[0]
> -        else:
> -            # Try a more relaxed search
> -            matches = re.search(r'based on .*?([\da-f]{40})', first_body, re.MULTILINE)
> -            if matches:
> -                base_commit = matches.groups()[0]
>
>      if base_commit and topdir:
>          # Does it actually exist in this tree?
>          if not b4.git_commit_exists(topdir, base_commit):
>              logger.info(' Base: base-commit %s not known, ignoring', base_commit)
>              base_commit = None
> -        else:
> +        elif not cmdargs.mergebase:
>              logger.info(' Base: using specified base-commit %s', base_commit)
>
>      if not base_commit and topdir and cmdargs.guessbase:
> @@ -246,6 +244,12 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
>          except IndexError:
>              logger.critical(' Base: failed to guess base')
>
> +    if cmdargs.mergebase:
> +        if (base_commit):
> +            logger.warn(' Base: overriding submitter provided base-commit %s', base_commit)
> +        base_commit = cmdargs.mergebase
> +        logger.info(' Base: using CLI provided base-commit %s', base_commit)
> +
>      if cmdargs.subcmd == 'shazam':
>          if not topdir:
>              logger.critical('Could not figure out where your git dir is, cannot shazam.')
