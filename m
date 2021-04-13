Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0B6D13
	for <tools@linux.kernel.org>; Tue, 13 Apr 2021 21:40:34 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id f19so1782250qka.8
        for <tools@linux.kernel.org>; Tue, 13 Apr 2021 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=rc/h8XebFGxUwRQXTRLwpyqDUmNiftn9f4XgaFFnPKI=;
        b=Ilszg+VQ97VEmTBfpEJApgi3HacSHfymvUXkbpDtNO/7Xw0dAbb6qnMy/eTNmbFe4s
         lkaHqawB7RN1u/XkxnAUYqLsAxknzyPd4wOMpaSS2nVcMszSkgKrr07WGhKAM3DbCZ1/
         pLueBYwVxwzQgIt2KINcllFXivzgUb+QLFnhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=rc/h8XebFGxUwRQXTRLwpyqDUmNiftn9f4XgaFFnPKI=;
        b=fDyvw4LOB18VSyHSZ1NjjrUhmyk4V2fktJgwwJhn2tb0MEZaQ7ornWuKkycMEx8m+Y
         m2sxVsWHiCWAA3+xvIRbjAshC73et8ywayLEIgEz4BBhYjxavRPlf3e1p42hSQ/dMgoW
         XjwjS6BmfVITX/kdmOA66qo3OvgXCsJOVIt/KSJR2jm2uzL/1PiA9FiVeCDsV1iB18W3
         zlmEHdHR+iVwsEiRgUq4DZbweGjLKdCL2PCdOpQrbn4eH4mMY8LcXt4cPOXVjEIm9Gwt
         3n7N/YbALTe6GMTfwQk8GL9oJFehh8fDAw/MSScntJLK4Zx07BGS7ygzwWxcp12Nponi
         uC/w==
X-Gm-Message-State: AOAM532l3a9x4IvMKBBsYnaWsSBnnJzZnLMl/vJtoCNkPhXOAmB3aPFq
	YzuYYvxsufColk1+7NKoWxOsVQ==
X-Google-Smtp-Source: ABdhPJzno5vHzDXl8h2ZKxHzXAIDByJCVEvcovEqn2Qw80++7ZAcDFT2V4wg37POHytKbOpQ09tC3w==
X-Received: by 2002:a37:b704:: with SMTP id h4mr21402569qkf.177.1618350033659;
        Tue, 13 Apr 2021 14:40:33 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q6sm5138110qkj.50.2021.04.13.14.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 14:40:33 -0700 (PDT)
Date: Tue, 13 Apr 2021 17:40:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210413214031.fenjvgh5helyuqdz@nitro.local>
Mail-Followup-To: Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210413172901.1465307c@gandalf.local.home>

On Tue, Apr 13, 2021 at 05:29:01PM -0400, Steven Rostedt wrote:
> Now, I would really like the Supercedes: tag, as its just a link you need,
> and not a email sent. Ideally this would be in all the patches (with a
> direct link to what it Supercedes. I may update my scripts to do exactly
> this, as I always add a "Link: " to the last version, and that's in my
> repo. Or perhaps b4 could add this too!

I'd rather folks used the following notation in the cover letter/patch
basement:

    Previous versions:

    Link: https://lore.kernel.org/r/foo # v2
    Link: https://lore.kernel.org/r/bar # v1

This is much more succinct, indicates the version number in the trailer, and
removes the need to remember how to spell "Superseded", as there seems to be
little consensus. :)

The tooling on the kernel.org side can automatically send the required
follow-ups to previous threads when it finds these trailers in newer
submissions.

-K
