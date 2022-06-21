Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE52138F;
	Tue, 21 Jun 2022 15:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C65C3411C;
	Tue, 21 Jun 2022 15:53:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ihbaeP3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655826789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtAsXwpYwkWvN5ju+WNRNyPoJCPmfu96018hvgkn5WU=;
	b=ihbaeP3GzDuWQHj8+vQ7jJEFurlZ8T9hzTFXPkoc6q4sDmaV7s7wHmFFtKcymS47kCRgoS
	znt5FHFyZT7rPZk4T/NZlBADDKne/GMDM/TTS69oP9Q4vlOHwtsgkajKUuglXoOf0BoXXX
	WA7T2BT6ppzjTQlhtXk2a5cKBBhhh6M=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d39b3aa8 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Tue, 21 Jun 2022 15:53:09 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id d123so14668590iof.10;
        Tue, 21 Jun 2022 08:53:08 -0700 (PDT)
X-Gm-Message-State: AJIora9cozvNJzTRUZhx4PIkN5C7YeWIK4KgBOaokhtBO6fdUFt8Wh9+
	AXheTqf9SBmglx+LMHoxpizqlORB50miJRTTf94=
X-Google-Smtp-Source: AGRyM1vDvTYrPj5VMISksrhWbV7wY3tLjymYcV40C6KrYNUH9fEy8tt6oA4O2snO0XSJsb8fKSuk4uwLCA2jPg7gA8Q=
X-Received: by 2002:a05:6638:2113:b0:331:feae:af81 with SMTP id
 n19-20020a056638211300b00331feaeaf81mr16247694jaj.196.1655826787674; Tue, 21
 Jun 2022 08:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Received: by 2002:a05:6e02:791:0:0:0:0 with HTTP; Tue, 21 Jun 2022 08:53:06
 -0700 (PDT)
In-Reply-To: <20220621152903.czivp7fdn6me775i@meerkat.local>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com> <20220621152903.czivp7fdn6me775i@meerkat.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Jun 2022 17:53:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9p60mMq230jkUL2s7JEUGA4SC=1XRJ+R=X0NvHcJFZePw@mail.gmail.com>
Message-ID: <CAHmME9p60mMq230jkUL2s7JEUGA4SC=1XRJ+R=X0NvHcJFZePw@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 6/21/22, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Tue, Jun 21, 2022 at 05:20:02PM +0200, Geert Uytterhoeven wrote:
>> > 1. default mode that applies patches directly to your git repository,
>> > just
>> >    like passing the .mbox file to git-am
>>
>> I gave it a try, and noticed a difference: with b4 am + git am, the
>> Link tag is added first, followed by my SoB, while b4 shazam does
>> the reverse, and adds my SoB first.
>> I believe the b4 am + git am behavior is correct.
>
> I'm guessing you were adding the SoB with "git am -s" as opposed to letting
> b4
> do it?
>
> I'm not sure there's an established "correct" behaviour here, as various
> maintainers either stick to arbitrary ordering, chain-of-custody ordering,
> or
> have a very strict "I like all my trailers sorted in a very particular
> order"
> approach.

Chain of custody is the only order that has any applicable meaning for
S-o-b. Otherwise what's the point of S-o-b in the first place? These
tools should be encouraging the right ways to do things rather than
catering to a potpourri of wrong ways.

Jason
