Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4F376
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 01:56:43 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id v8so9024289qkg.12
        for <tools@linux.kernel.org>; Tue, 06 Dec 2022 17:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zyd4rl38JUxl2OaHsCq0B2uxdLy+pUgHFkpg5PpP/c=;
        b=XzE7V4yXviJipHEw4T5QvlXSgwCbt7IcV3VCHS2u0ie4835u4k0RBaNLmq/zGGDRb2
         apS1c6b/g5xhdFEY/BJgxA2qSSZt+o+hEw+4RwVpR/B1n0jq4NNDOqqmxasuS5eVQh50
         kFmDLdzayyseuoF/xPHrZkoLXhQTcLfAgOm7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zyd4rl38JUxl2OaHsCq0B2uxdLy+pUgHFkpg5PpP/c=;
        b=jJLYFWJf6R5Y/lIADrfPk2jOQFW30q1kLa5NJiOd9BOq6qeohrsIC41OHE6GehJuMq
         ezoBdLei6FgYmQP5rF7N+R9rwXo81LdMFP5k8TXIRF/kRAjwSXwUYlFhPS/g4jmebDgN
         osoOJEOCFxuEwH2cxtjelD2W2OIskNSXI5yTve5TGnzGXtZFH1KU+dinMPR6jFpquPjw
         mGyOw+Vc+4s2iE7u0PuI4M5a11/uAlmk84UpdeHTjJadwoAd8QEpdo6KjEeZ4pgmUSzM
         qKiC+oP+Cz1JLCGqSIrhjK/leQONLZ94qLlIHsx8dBfG+J0CHhVbKBO30si39+Lff0y6
         s8RA==
X-Gm-Message-State: ANoB5pkvQUjW05zaBz//8RDBzKAUn9fd0v1pLN/Zk79xAahD9OvkFLJD
	14XrKWgCAF06MFegWmA6ntvcUA==
X-Google-Smtp-Source: AA0mqf5mvqIQP/XFoQw0dCex/AzhcJ4h7R/OazIlPDkhyGIdwGjOXvnr4Lm9UZ0Gx+Ay9xVlJBE9MA==
X-Received: by 2002:ae9:f11a:0:b0:6fc:a3a1:5e63 with SMTP id k26-20020ae9f11a000000b006fca3a15e63mr23861259qkg.5.1670378202710;
        Tue, 06 Dec 2022 17:56:42 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id w42-20020a05622a192a00b003431446588fsm12503765qtc.5.2022.12.06.17.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:56:42 -0800 (PST)
Date: Tue, 6 Dec 2022 20:56:41 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 trailers doesn't work with imported series
Message-ID: <20221207015641.uwiohcvofrndeqch@nitro.local>
References: <Y4/hIf+o/e3AtBCD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4/hIf+o/e3AtBCD@sirena.org.uk>

On Wed, Dec 07, 2022 at 12:41:05AM +0000, Mark Brown wrote:
> Not a common use case but if I do for example:
> 
> | $ b4 prep -F 20221117104636.639889-1-broonie@kernel.org -n tap-spec-relax -f v6.1-rc1
> ...
> | NOTE: any follow-up trailers were ignored; apply them with b4 trailers -u
> 
> I run the suggested command but get:

Great finds. Fixed now in master. Mostly, this was due to us not expecting to
find a series without a cover letter (which is normal for a single-patch
series).

> BTW I also notice that no template inter-version chnagelog is
> generated for the b4 prep command above, the same thing seems to
> happen even if the sent series has a cover letter.

Yes, this needs further work. The major difficulty here is that cover letters
are so free-form. We enforce some structure when we create the series from
scratch, but when we import it from another existing series, there's no way to
reliably tell if there's already a changelog section -- so I think I will just
bluntly insert a brand new changelog section and let the contributor fix any
obvious errors using --edit-cover.

Thank you for the report!

-K
