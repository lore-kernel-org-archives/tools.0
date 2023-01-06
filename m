Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020CA2F43
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 16:34:45 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id l184so2005431vsc.0
        for <tools@linux.kernel.org>; Fri, 06 Jan 2023 08:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6TCgUMd2nM5iNRU5fsrDdvem5KVwcOoRYmfw7a78PE=;
        b=FDqY67Usqfz32nZhnOv0iR1Ic0KffFB4zBxtnEgSOPL3bdY5X7SQDUE8jZZcJa6z6H
         78lKNvMAnVz9I7QckFE4/UCBTPlIG5NTuU6xxdX2bqlyVy9fQy7nsbe4B7tcmuK1q8Fm
         7AQi80OBafaK1G2MfX82sbYqmbbQI1M+51/Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6TCgUMd2nM5iNRU5fsrDdvem5KVwcOoRYmfw7a78PE=;
        b=reJ0VPb4Sm9LKoGXFr1BGmrkn0EoLSqAdsS1pPcZzoB6b7Ods/RiPkiSoajt6Pj6M0
         PsrHzwpJUYB8MMh9epNWKWP7qeJrI7IfPzCiOrfutGUQnnH0PF0UePTLymCEp9WujEqA
         2QCM5lVSQby8cfVF9vhMGtmBEn/BCXSxjX4hUjysGdcaqVJa1Lsbtwg58/mgqkDpZ1JY
         SeHAFs4OD7tCAPEusZ1HBQhb0j/lauPlEf1vrN+4D73+0JwqdsRDVhgBHJPAO3EvDLKS
         JBS9YMyPAA3PD6L0+pDG+MgmFQkwVlWUPrIR5cmP1moLLzP8UvzFZ/a59CoL+Tt1oEkb
         SPqw==
X-Gm-Message-State: AFqh2kqdkVRMAHZB7UhqKZME3iHaGWnB8099FulgROFYSlTwS2kyIh7G
	JpyAQviQlyRxfWmHLP7eMNxa3qPy2vpCbbp2
X-Google-Smtp-Source: AMrXdXtw/k6vvgJSR/XxFQEzWgKhLm7tQhVTJuxLPm9nfmBQV4tnQz5OQIgPJD+sz2tZ96P0cu6SrA==
X-Received: by 2002:a67:ec4b:0:b0:3cb:aaa:81d8 with SMTP id z11-20020a67ec4b000000b003cb0aaa81d8mr17425901vso.16.1673022884744;
        Fri, 06 Jan 2023 08:34:44 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id g16-20020a05620a40d000b007055fa93060sm754039qko.79.2023.01.06.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:34:44 -0800 (PST)
Date: Fri, 6 Jan 2023 11:34:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Address from trailer on individual patch is sent entire series?
Message-ID: <20230106163442.aziaoa3tndqtyisp@meerkat.local>
References: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>

On Thu, Jan 05, 2023 at 06:27:09PM -0700, Nathan Chancellor wrote:
> Hi Konstantin,
> 
> I was going over my recent "sent with b4" series and I noticed that the
> kernel test robot, a Reported-by: on a specific patch in the series, was
> Cc'd on the entire series.

This is one of those time when people's expectations diverge and either way
you do it, someone will find that it's not how they want it to work.

Originally, my polling suggested that everyone always wanted to receive the
entire patch series, even if they were only responsible for a single patch.
This was later changed for in-patch "Cc:" trailers, because there were actual
CI workflows based on that and sending them the entire series was causing more
harm than good.

However, every other trailer will still receive the entire series, because I
believe it's still more correct than just sending them a single patch. If
that's not the actual consensus and we decide that all other in-patch trailers
should be handled the same as Cc: (they get the cover letter plus only the
individual patches where they are cc'd), I can certainly implement that as
well.

Regards,
Konstantin
