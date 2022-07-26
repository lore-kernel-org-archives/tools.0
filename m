Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BE6036
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 20:56:57 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id b11so7010558qvo.11
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O6NrCu+n2/gKgqCDUiHEoz4aIXddU1V5+jXQ2sx52v8=;
        b=MUC/CcsUfbpY7QOQNtLiEwV/4Lq3dj//elZIWtiKBCbSomjG9lyXKZOV7ElgmKtyW7
         jHMfcS9o0/AJ2V7WWGt2iTHWtI7J+jjdkXf5yoRFuaY/vECcN03lFEh8q58QNW0mvRgv
         Z8NukiX1pFlerg0e3LyEV0iaH7wYRscWGNh2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O6NrCu+n2/gKgqCDUiHEoz4aIXddU1V5+jXQ2sx52v8=;
        b=5Y+fWpqByQdYJfsAo9I05qfxDzqUII7DbmSYQ8QGfRU5RdVTl6zTU3qF8TuxEdtQQR
         NdNat2pUaoKwYWjdValMsbH+p7VKW3kNIHZ1BVN0EPlGqvTWXcfQLsSuSG+nlUa+XRm2
         gkyzCVVkQS5NGq+fSzDtMhYB4Eciudo+5SmQMcbOfoTUFsJdqyRO0RFrvALeGINiquIk
         94PxibdCT3YEZj05VQF8d6z08rAdruGzafy5NbMswRYw1LJhJBN1LLKR7ZWVANpdO13r
         +3SUEA2Fo0KuwF4JQ3r28FtUgHAnyMAvu4J9fpmM+aXvK5gd+sbL+yzaSuxO3Kafagus
         U5Rw==
X-Gm-Message-State: AJIora/hwYrQSArWZGGb8wGgjfd5U5OkF9LAoGEzLbwlczreewKZtyDl
	4OVs0siuo3Sdu25yzLnjZImX2w==
X-Google-Smtp-Source: AGRyM1t4mFeP8OqkxDhiGz+HmWeEIiKdM8UP2AzPjdz2OMeFrhxUPbvL0TSxfnEOvcz4C0avYrRPJA==
X-Received: by 2002:ad4:5cad:0:b0:473:7346:c684 with SMTP id q13-20020ad45cad000000b004737346c684mr16850898qvh.27.1658869016368;
        Tue, 26 Jul 2022 13:56:56 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id he6-20020a05622a600600b0031f287f58b4sm6579553qtb.51.2022.07.26.13.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:56:55 -0700 (PDT)
Date: Tue, 26 Jul 2022 16:56:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220726205653.yjmafga3utcwjef7@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local>
 <87bktbapri.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bktbapri.fsf@baylibre.com>

On Tue, Jul 26, 2022 at 04:54:09PM +0200, Mattijs Korpershoek wrote:
> > I think that makes it hard to distinguish from "b4 am/shazam" that also
> > operate on series. In my mind, the command should indicate that it's
> > specifically for working on series for submitting them upstream as opposed to
> > for retrieving series for inclusion into your repos.
> >
> > Perhaps "b4 prep"?
> 
> Understood. series is indeed ambiguous and "prep" or "prepare" seems
> more appropriate.

Okay, the latest master should have all this work in place:

- b4 prep
- b4 trailers
- b4 send

See --help for each of these subcommands. The only notable change other than
that:

1. `b4 prep --format-patch somedir` will output the current series as patches
   in a format very similar to format-patch (no To/Cc auto-population and
   minimal headers)
2. `b4 send --dry-run -o somedir` will output the messages exactly as they
   would be fed to the SMTP server

You should be able to git pull and continue with your existing series. Thank
you for your feedback -- please let me know if something else can be improved.

-Konstantin
