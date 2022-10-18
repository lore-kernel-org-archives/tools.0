Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467734C98
	for <tools@linux.kernel.org>; Tue, 18 Oct 2022 20:18:07 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id b25so9427858qkk.7
        for <tools@linux.kernel.org>; Tue, 18 Oct 2022 13:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yIfiTVG/CEmaK14tHgECUicaFxiKGkDW+9sX+3z6ShQ=;
        b=JiCtgfCBMdKJPQ0vnj38x8AMiH9yFrZWMu0vIQPi4kpzJPPHorFIb19xQGy2/ZFRhV
         WY5wGE7Y5If4m0YDlrr0PTIQ6QnJZPJK05DEbKBLghlQUPBrUxzXzkIp4na/9Tf8AzFv
         r68hoAnYWxhus9Pu1ktAGwJfTgx2ET3qUTGBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIfiTVG/CEmaK14tHgECUicaFxiKGkDW+9sX+3z6ShQ=;
        b=Eztxe7i1YoecxPgCeYIa41qGQreR4kKPktucJGlPVfVmabm6BrxSnOEuRkavSUF5d+
         c07daeZZzWVrvAL0n7hJrEHD4nppFoiENsYtjnpis5oNDnMg6VZ0XxRXVDSMM1OGEwmX
         LRbhP7ghZfDkBGrupPbtlXM8pZVVZQriqRIYdwWT6AY2EJ8Jwvjr+1ypYBte+9J0/EpB
         pWtGNSC94Alw35yGhE5RtEm9V8kLbBqtFb+HE3cA/cQ2zBbzk47915JTI5lPCzC9ZrkG
         6DRb0T1fXgRSR9ZtMBP2GVgxmI8zkAiRlsMBOtWV83C4cr3W3lon0BKO9X08R2YDhm9a
         Rs5g==
X-Gm-Message-State: ACrzQf3kSjfXGw/zfIPaWNABvyE/ku64A9bXuFVe7ajxbs5gVwFvM1EN
	D2Wr+rfw7MaJltEmO78LFhRi3w==
X-Google-Smtp-Source: AMsMyM7/KXtlUBDW2dM5HPB7drEEN83grtd0/JrEsyoBKhM9VQ1etO7EZvYFl4PB2cBgEZlC/BADPA==
X-Received: by 2002:a05:620a:1a9e:b0:6ee:d7f8:e437 with SMTP id bl30-20020a05620a1a9e00b006eed7f8e437mr3131169qkb.162.1666124286045;
        Tue, 18 Oct 2022 13:18:06 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bx14-20020a05622a090e00b0035ce8965045sm2524631qtb.42.2022.10.18.13.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:18:05 -0700 (PDT)
Date: Tue, 18 Oct 2022 16:18:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221018201804.na5x7lohm4yszg5h@nitro.local>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221018153620.tyuedbldi2ofbe2x@houat>

On Tue, Oct 18, 2022 at 05:36:20PM +0200, Maxime Ripard wrote:
> Hi Konstantin,
> 
> Thanks again for b4, it's really great :)

I'm glad you're trying out the "send" functionality, despite its experimental
state -- your feedback is very welcome.

> There's a bunch of things I have noticed in the recent weeks:
> 
>  - It looks like 87e0e464959c breaks msmtp which doesn't recognize the
>    -f option, and will just error out

There's got to be something else going on, since -f is required for sendmail
compatibility. The msmtp manpage specifically mentions that is supports it:
https://manpages.ubuntu.com/manpages/trusty/man1/msmtp.1.html

(see under "options specific to sendmail mode")

>  - Generally speaking, rebasing a b4 series is a bit troublesome:
> 
>    - It's a bit tedious to do. One needs to rebase and then edit the
>      cover letter by hand without b4 being involved. I don't think doing
>      the rebase interface all over again is reasonable, but maybe we
>      could add a subcommand to set a new base?

Interesting. I'm not sure I fully understand the problem, but then all my
rebase tests were all very simple cases of running "git rebase <newtag>"

Is there a reason why you have to manually edit the cover letter after a
rebase?

>    - If one sends a version, rebases, and then runs b4 trailers -u, then
>      no tag is found for that series. I assume it's because the
>      change-id has changed, but maybe for series that differ from the
>      last sent version we could also look for the last sent change-id?

This is really strange, there's got to be something else going on. Here's a
simple test I just did:

First, I create a new b4 prep branch from a random patch series, and base it
off of tag v6.0:

    $ b4 prep -n test-rebase -F 20221018111232.4021-1-elic@nvidia.com -f v6.0
    Checking attestation on all messages, may take a moment...
    ---
      ✓ [PATCH 1/4] vdpa/mlx5: Fix rule forwarding VLAN to TIR
      ✓ [PATCH 2/4] vdpa/mlx5: Move some definitions to a new header file
      ✓ [PATCH 3/4] vdpa/mlx5: Add debugfs subtree
      ✓ [PATCH 4/4] vdpa/mlx5: Add RX counters to debugfs
      ---
      ✓ Signed: DKIM/nvidia.com
    ---
    Created new branch b4/test-rebase
    Applying 4 patches
    ---
    Applying: vdpa/mlx5: Fix rule forwarding VLAN to TIR
    Applying: vdpa/mlx5: Move some definitions to a new header file
    Applying: vdpa/mlx5: Add debugfs subtree
    Applying: vdpa/mlx5: Add RX counters to debugfs
    ---
    NOTE: any follow-up trailers were ignored; apply them with b4 trailers -u

Next, I rebase it on v6.1-rc1:

    $ git rebase v6.1-rc1
    Successfully rebased and updated refs/heads/b4/test-rebase.

Now I update the trailers:

    $ b4 trailers -u
    Calculating patch-ids from 4 commits
    Checking change-id "20221018-test-rebase-108ba0501f16"
    Grabbing search results from lore.kernel.org
    Nothing matching that query.
    Retrieving thread matching 20221018111232.4021-1-elic@nvidia.com
    Grabbing thread from lore.kernel.org/all/20221018111232.4021-1-elic%40nvidia.com/t.mbox.gz
    ---
      vdpa/mlx5: Fix rule forwarding VLAN to TIR
        + Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com> (✓ DKIM/oracle.com)
      vdpa/mlx5: Move some definitions to a new header file
        + Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com> (✓ DKIM/oracle.com)
      vdpa/mlx5: Add debugfs subtree
        + Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com> (✓ DKIM/oracle.com)
    ---
    Invoking git-filter-repo to update trailers.
    New history written in 1.26 seconds...
    Completely finished after 1.57 seconds.
    Trailers updated.

I think I need to better understand your workflow to grasp where the
disconnect is.

> And finally, and this is more of a feature request, now that it looks
> like we have the list of all the older versions in the cover letter and
> their base, could we have a subcommand to start a range-diff between an
> older version and its base, and the current base and HEAD?

It's already in master. :)

    b4 prep --compare-to vN

Best regards,
-K
