Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D31882A
	for <tools@linux.kernel.org>; Wed,  1 Feb 2023 21:47:28 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id m12so7217941qth.4
        for <tools@linux.kernel.org>; Wed, 01 Feb 2023 13:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik/zsHhZSIxTkgmMCL8mB3kMkKiRC9LP6pTVYO3LWZQ=;
        b=dMZ/o+w+7pRmo5/VPnYswfIs8oPxRN0ForXHqVu/uu6WEqFuHgkPvIoHRQinIx5Dbe
         kgFF0LWVZjan4hZXI8G3sDBZXOkNxToneoiWeycsODUSuQ0puz02tDvuW6emBrRDUgva
         p2n9nsNDyDcYtzFxtNTPpobMk2ip9RUMPepBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik/zsHhZSIxTkgmMCL8mB3kMkKiRC9LP6pTVYO3LWZQ=;
        b=djL8la8VL5HfcX3goDCZROvrhJl+qjRgx4nAijgd4QER03pwLEwbPMr/fod1/YCRo9
         uUxNwEFGs006gA2XffcXM5SWRxf6L7nzN1wb6820liamVwJ8KXJRL+GOHbI4s/LlGbT2
         7UKQ6dv46+56UsyGtnxaRu94aMqkxvDffZyqJgxZv3LCM6nbfdfdIbkhf9uCyCbb4t+h
         X09YPc83q+GbC6iW80vsxZjtwMEZi6I/qwTp9HC88MAhxrbmQhrKV4O/BMogkAT2FT5C
         AlsZ3t4ANQSJ5vJBpkstBxPPSv2OME1ElJabrXjovIjwaB3kU8Wv0GkLeXGnvcSQCkjO
         2jBQ==
X-Gm-Message-State: AO0yUKW2cvqrE+SAFBb0+MW6KFOY8o6chWcLzGsfmihBkkK1fiiK8NU2
	Up8To4oc8UPzYSPs+P/kY2RA/4ZrIFZbsvSa
X-Google-Smtp-Source: AK7set8oT2nfR1bcXHBNd0fC4VErv/4LdoJ/OPHGMOK9X9JHPIhvQI9Xxyf5ddB7tyLEdVeB+x1WhA==
X-Received: by 2002:ac8:7f51:0:b0:3b9:b4f9:d35f with SMTP id g17-20020ac87f51000000b003b9b4f9d35fmr7147126qtk.49.1675288047400;
        Wed, 01 Feb 2023 13:47:27 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id g9-20020ac842c9000000b003b9b8ec742csm2075881qtm.14.2023.02.01.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 13:47:26 -0800 (PST)
Date: Wed, 1 Feb 2023 16:47:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Cc: Tools <tools@linux.kernel.org>
Subject: Re: b4: idea: checkpatch.pl integration / hook support
Message-ID: <20230201214725.isvlkqy5sajpsgnk@nitro.local>
References: <233f0440-7f20-6edf-256c-b8ebec53539e@tessares.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <233f0440-7f20-6edf-256c-b8ebec53539e@tessares.net>

On Tue, Jan 31, 2023 at 05:06:51PM +0100, Matthieu Baerts wrote:
> First, thank you for developing and maintaining this great tool!

Thank you for braving the experimental features!

> For some like "b4 prep --auto-to-cc", that's probably OK to miss this
> command because "b4 send" will mention that these patches will only be
> sent to the author + other emails found in the patches. (It might be
> interesting to have a more visible warning / confirmation if no
> addresses are found in the cover-letter but that's not my main point here.)

Yes, I've tried to think of several ways to avoid this, but each has its own
level of annoyance. One thing I will definitely make it in:

- if there is a b4.send-series-to/cc defined, we will insert these addresses
  into the cover letter at the moment of creating/enrolling a new branch (`b4
  prep -n`).

This will help a little bit, but not with the kernel, where it really is
important to run the underlying command. I'll think about your suggestion to
give a warning for when there are no To/Cc addresses in the cover letter.

> But for 'checkpatch.pl' or other scripts specific to some subsystems,
> there will be no reminders from "b4 send" to check that.

I'm trying very hard not to make this a "tool to send kernel patches." :)
However, yes, we should offer a way to do pre-flight checks on the series,
probably via `b4 prep --check`.

E.g. it would make sense to make this definable in a per-repo .b4-config file,
like so:

    [b4]
      series-check-cmd = scripts/checkpatch.pl -g

The command should accept a git range as the last argument, similar to what
you're doing below.

> For occasional contributors, it could be nice if it is automatically
> executed before sending a patch. But I understand there might be other
> issues to deal with: missing dependences, false positives, different
> rules per subsystem, etc. A mention in the doc and/or before sending the
> patches might be enough.

Yes, I'm reluctant to make this run automatically during the "send" stage,
but for sure we can do a --check command.

We can also integrate the same command into "b4 shazam" so maintainers can run
checks on the series they are reviewing.

>  ./scripts/checkpatch.pl --strict --codespell \
>     --git $(b4 prep --show-info | awk '/^start-commit: / { print $2 }')..

Let me make the following two things that will make this less awkward:

- I'll add "series-range:" to show-info
- I'll make it so it's possible to get a single value out of --show-info, so
  you could just run $(b4 prep --show-info series-range)

-K
