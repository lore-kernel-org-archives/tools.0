Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9684C76
	for <tools@linux.kernel.org>; Fri,  7 Oct 2022 18:11:26 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id l27so3281264qtv.4
        for <tools@linux.kernel.org>; Fri, 07 Oct 2022 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8WkOZAbqY1yZlXTTSHiul0PsjeTb0nBZfpFmhiDvsE=;
        b=Ia7z8lnQbaWDz0oVvxtqq5mUkGjgcydQ9VcfiVQyWXqFdzOHpT0xIGirxIe06L1Oe5
         SMQmwEG8OJpD4Un/OHNC7njrNdqLUpwuNRqCEx9mO2V/R1V8sO66Z9hrPQjx8avU1qXj
         8oBcjoDS+kqncwyudkvMjHNtDfrLxMp0AQrfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8WkOZAbqY1yZlXTTSHiul0PsjeTb0nBZfpFmhiDvsE=;
        b=Klzt3gEVwm0UDmye/5UlTXzkvwhctTDVjuXv0ooD/McH3oE03WnVfpOr3v80B8rAql
         KtS2td6HOUckbaNXfLkuj5nttF/GO9iZABWbWwsQVpMRim1OrfKLnG6jTGSqld9sKVG7
         b1s92rvG95x5z6KWQRBQz3YoY3ocLZiXnce1JnKKLVR9W4HjmG+VpAezzN8d6PYv47Be
         nAA5Qe/ByBiEu+v9s8KOikQvQiyhk9oNPPGQ1CUBjWpPuUHn48lt16hsP1zT2APPWp9g
         q3lxMTgQLKwMi3Hj9Qx32qqNflJNQL11Th/XpmuUkcuKvfcCWJHb0qeXlnM0bN+q0BsI
         JUiQ==
X-Gm-Message-State: ACrzQf1Ww7vMsTXmzxs9VM6yNuM5PwMZss28tAzKG1M7XMB7QzD29rqH
	gQXavLMRITsd268H31jiGLaPLw==
X-Google-Smtp-Source: AMsMyM72/tc5DLCkntELZtzB0Trr5YjZ0ofmglQVLEUu3Jnsokor3GrkiGoQ9jSxQo59NHf6nb4+aw==
X-Received: by 2002:a05:622a:1c8:b0:35d:50a5:3d2c with SMTP id t8-20020a05622a01c800b0035d50a53d2cmr5230096qtw.520.1665166285255;
        Fri, 07 Oct 2022 11:11:25 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id v13-20020ac8728d000000b0038cdc487886sm2476889qto.80.2022.10.07.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:11:24 -0700 (PDT)
Date: Fri, 7 Oct 2022 14:11:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.10.1 is available
Message-ID: <20221007181123.xnc2ihmbmefk5q2x@nitro.local>
References: <20220926172903.f3mudqmts5woudll@meerkat.local>
 <CAL_JsqJVY5Mk0e+wLXQBJnY0OwR=vh24MhqTqmaozBjaBAULKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJVY5Mk0e+wLXQBJnY0OwR=vh24MhqTqmaozBjaBAULKQ@mail.gmail.com>

On Tue, Oct 04, 2022 at 02:03:08PM -0500, Rob Herring wrote:
> I found a couple of issues with trailers and send. I'm on the current master.
> 
> In 'b4 trailers', if the patch id doesn't match exactly and it finds
> some trailers, b4 just prints 'No trailer updates found.' which is
> misleading. Can it have a fallback to subject matching or at least
> print when there isn't an exact match and list the trailers found.

Strange, I thought we already did fall back to subject matching when we
couldn't match by patch-id. I'll work to set up a couple of testcases so we
can easily identify such regressions (if that's what it is) in the future.

> It's quite common to either have minor changes (and a judgement call
> on whether tags still apply) or a review that's 'With X fixed,
> Reviewed-by: ...".
> 
> The 2nd issue is with 'b4 send' and seems to have been introduced
> recently. I have a commit msg like this:
> "
> Some commit
> 
> Signed-off-by: ...
> ---
>  v2: https://lore.kernel.org/all/20220909204509.2169512-1-robh@kernel.org/
>    - Rework YACC code to handle configN formats in C code
>    - Add a warning when an unknown configN attr is found
> "
> 
> I'm putting '---' in the commit to store the changes for the commit.
> The patch ends up with 2 '---' lines, but git drops everything after
> the first one. The issue is that
> '//lore.kernel.org/all/20220909204509.2169512-1-robh@kernel.org/' is
> added to the Cc list.

Thank you for the report -- I wasn't expecting to find changelog entries in
the commits, so I'll add that to tests as well and fix it up.

-K
