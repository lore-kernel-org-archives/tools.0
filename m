Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B870
	for <tools@linux.kernel.org>; Fri, 28 May 2021 22:43:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE2CD61183
	for <tools@linux.kernel.org>; Fri, 28 May 2021 22:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622241791;
	bh=PgkHbqieNOdv21lwIsQAXU88e06TwVZa6GOktuB4RYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ISIIPw/qhAj8oUh0FxnGtWlvp8QNdbhbdXhuELlhVRq/7UhHxWo5EgeXA5f1S6Ztp
	 6iS6vR9T4VuqLJPoIgMfug2aG0iMarXh/lIrWN+aXXkdoUfwMFFiDnIkUb0PIuI/yj
	 1u+lBqgUF1fmX3tIlWiUeAA+515XzuiHcGe5Ed5SPm4Z3SFN3NmFn/t3kvDqtBI2qb
	 paz6h+sPnqgnx3V9og0t0xAGS8K4KyK8u+YWm3mumaNCdZznLKAsWZn3JgkzDVpuIE
	 YIERVOKANlYHIBaQOO7qc7dnbSC/JN5zlBSseLRH4HgFFMgRSar3MJooa5Pz4dWq9o
	 poH4x6GyoSRdw==
Received: by mail-qt1-f170.google.com with SMTP id v4so3871838qtp.1
        for <tools@linux.kernel.org>; Fri, 28 May 2021 15:43:10 -0700 (PDT)
X-Gm-Message-State: AOAM531hLnvsz0M5Zbr0EeVcpcyD+lhawT02pFpWv7hpCo4RqJ/Mt8oN
	0grq/LqS/+gS/VGUXqffkExMCZWmpi1cOcmyWDQ=
X-Google-Smtp-Source: ABdhPJzMyFZKMGQKLao6jfjH/Zrauzzckp1+B4pfp+mdHNafZK+vej1uzLkrCsc6vUrniQScnk6kQPheNU6LEa04swY=
X-Received: by 2002:ac8:4750:: with SMTP id k16mr5574541qtp.13.1622241790165;
 Fri, 28 May 2021 15:43:10 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
 <20210528193834.mwf6qvuw6wng7yoz@nitro.local> <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
 <20210528195320.c2vbhfg3zj365ebw@nitro.local> <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>
 <CAB=NE6X5uUWA7Sfu_qvz2smddgc4euBT-x7xGs8=7+K-W5v2RQ@mail.gmail.com>
In-Reply-To: <CAB=NE6X5uUWA7Sfu_qvz2smddgc4euBT-x7xGs8=7+K-W5v2RQ@mail.gmail.com>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 28 May 2021 15:42:58 -0700
X-Gmail-Original-Message-ID: <CAB=NE6VF1W-Wdp9+cmb-ehJ2Gf5_1yqYxNd1qp3Z=acgbYUe3w@mail.gmail.com>
Message-ID: <CAB=NE6VF1W-Wdp9+cmb-ehJ2Gf5_1yqYxNd1qp3Z=acgbYUe3w@mail.gmail.com>
Subject: Re: grokmirror and pi-piper for all emails on a list
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021 at 1:46 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> Figured folks might be interested... it took only about 5 minutes on
> the first run, the second run, with my settings took about 8 minutes.
> Not too shabby (nvme drives)!

It ran fast as it only processed lkml, but 8 minutes for processing
the latest epoch for lkml is also not too bad. Anyway let me know if
anyone has any idea of the following:

So after some debugging I am seeing that with a setup as follows,
running grok-pull -c ~/.config/lore.conf seems to not run pi-piper if
any of the repos being processed doesn't need an update. If I actually
also force the pi-paper.latest to each repo to say, the last 3rd
commit, I still don't see the last 3 emails coming up. But if I run
manually against reach repo like this:

grok-pi-piper -c ~/.config/pi-piper.conf
.local/share/grokmirror/lore/linux-fsdevel/git/0.git/

Then it triggers it to deliver mail as expected. So I am thinking the
following config may be missing something to force the post hook to
really run for each repo, or there may be a bug somewhere. I removed
the new lines from the include as it was not clear if having each
target repo per line is fine. And if you have each repo, if spaces are
allowed, or tabs are allowed.

$ cat .config/lore.conf
[core]
toplevel = ~/.local/share/grokmirror/lore
log = ${toplevel}/grokmirror.log

[remote]
site = https://lore.kernel.org
manifest = https://lore.kernel.org/manifest.js.gz

[pull]
post_update_hook = ~/.local/bin/grok-pi-piper -c ~/.config/pi-piper.conf
refresh = 300
include = /linux-fsdevel/* /linux-block/* /linux-btrfs/* /linux-xfs/* /lkml/*
