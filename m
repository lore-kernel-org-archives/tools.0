Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C401679CE
	for <tools@linux.kernel.org>; Mon, 27 Mar 2023 21:18:12 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 59so7709890qva.11
        for <tools@linux.kernel.org>; Mon, 27 Mar 2023 14:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679951891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dfKTVwwVyvOaIVndWkdZuKN9Z4+khJ9Mh02pf1XG0w=;
        b=H6wXSp2fuRkhulYccTeuJr7z4Tc3GwhNldEQbb6Wd2XWy4P1p4mCrIVCAqmo7B+fp0
         S7+Ll50GXTjp3AlivwQvONMR18VfuNdL/yIDXyEfsbihezhgFe3izx6Es0NWHtwmH5wv
         nHFXDb68OWYujVmQvSFN94FRZRUH2Ogn/Op4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679951891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dfKTVwwVyvOaIVndWkdZuKN9Z4+khJ9Mh02pf1XG0w=;
        b=yS2IoGF1neRHG6H2/x3+bmmFalkYYFJVF7gOrCzG1AggWGuGlIgF4Swo3AO08ZF7za
         8uZ4xwywGEDGELDFX5BCwtugeZxhxHkV/kG8KrgPc7kBNX0Or/Uy8FJcw8ufxk5a58eq
         6hdfoy7iRKJn7by+zhd7hbqyEVL8yMQl9X1EKf3TMO+B5/GGscC+VwT0omSJkCNCIb6f
         FhOlSBM+ZYNJ1smRwX83KBwFLc/D1JvIapWTeW+xKXivSsUV8z7wPGChNrvYoUyyJXkQ
         N0HKB3cyB/ia12bZpg2dS1H2MVuc6YylSDGJQQPkBEO07ECkCAYthb+grusJdX2xOzxh
         V2RA==
X-Gm-Message-State: AAQBX9fylsqzgy14R72hdWOsHxlcH8EyLeM1tFW6Iqf8RBn4l3t72y67
	/TPyTQhVbnSVooh7y+e5dj7vs2hsETB7HRp4HAk=
X-Google-Smtp-Source: AKy350aNwjFYJURH1ViEeCL1p2lgT48n4eFtCBBvVf0vkq6687lpBGWVX42tAb05EWXgMN+qO97GIg==
X-Received: by 2002:a05:6214:2025:b0:5a7:e9e4:5010 with SMTP id 5-20020a056214202500b005a7e9e45010mr27483690qvf.14.1679951891556;
        Mon, 27 Mar 2023 14:18:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id mu10-20020a056214328a00b005dd8b9345aasm3208410qvb.66.2023.03.27.14.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:18:11 -0700 (PDT)
Date: Mon, 27 Mar 2023 17:18:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Cc: Tools <tools@linux.kernel.org>, Christian Brauner <brauner@kernel.org>
Subject: Re: b4: send: support git notes per patch
Message-ID: <jx7vyqdj3qt2zwgsxh6hjac6osr52n2vcmkj2pg3elapcth62m@jtl27si2pa3g>
References: <9a4ebcd9-9d23-f525-cedd-222970f1b207@tessares.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a4ebcd9-9d23-f525-cedd-222970f1b207@tessares.net>

On Mon, Mar 27, 2023 at 12:20:43PM +0200, Matthieu Baerts wrote:
> Do you think "b4 send" could attach the "git notes" to the different
> patches being sent, similar to what "git format-patch --notes" does?
> 
> Personally, I find this quite useful: when you have a series with a
> bunch of patches, it seems interesting to put a detailed changelog per
> patch instead of putting everything in the cover-letter. It makes even
> more sense when some people are only Cc with a few patches and not with
> the whole series. I didn't find a way to do that with b4.
> 
> But then, I guess we might need a workaround implemented or shipped with
> b4 to preserve the notes when git filter-repo is used, no?

Correct, I don't want to touch it until we stop blowing away git notes every
time we run "b4 trailers".

BTW, another alternative to git notes it to add this info into the commit
itself, e.g.:

    libfoo: update foo bar

    This updates foo bar.

    Signed-off-by: Dev E. Loper <dev@example.com>

    ---

    My notes about the patch here that will be preserved by "b4 send" and show
    up in the patches sent out, but because they are below "---", they aren't
    going to be part of the commit.

> PS: by chance if you can have a look at my patches/questions for 'b4
> prep --fork-point', that would be nice :)

I know that it's been sitting for a while, and I'm not ignoring it, just need
to find a good stretch of time to dedicate to understanding the RFC set.

-K
