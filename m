Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422E3214
	for <tools@linux.kernel.org>; Fri,  9 Dec 2022 21:11:04 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id h16so4619258qtu.2
        for <tools@linux.kernel.org>; Fri, 09 Dec 2022 13:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dicy1hf6ZSTK62UUT+j2AbTsEzQ1agEeDM/hwARzU7M=;
        b=Qg4XebjHiRGumL6c+/t5e1M1TObI4omAWChVR1/Oewn3RND/fHMUv4wvXL9MF/8q1h
         VqZKy1EYXEwjHMWvfvoao4n4IMxq1zaGixaw1nB4bYIjOT6LmLKTDakaSNsleA5HXYaM
         ZKl0JOaDqxI8d8agfRqyEXTWeFe/j31lBtwC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dicy1hf6ZSTK62UUT+j2AbTsEzQ1agEeDM/hwARzU7M=;
        b=ApzrggYaspYL1GBmtkY1lXryZlbAyLdlDI+vGSpJjKbiBsRCXLbkI0Mi+984p5guNL
         cqfg6JsJVnSZSfDPJ7O5ZgoEqos7KR/GHmNF7LtyL49ISEszm2tXHZailuZzIK4BNLEN
         zRvLbOwOYhiPRrweFyOQ91QxkVjy79c6PIS1fnnbUUZw3l5bFPfXSiExZ+Hf3rwIDBb/
         h+eglDppDI18LuGYg3iN9ew3MlhmxRDXi2E4zqdbUpMkbhsk85h8iRTbVu2er8fXgr0y
         1yYtwOjk/oU65tObkk8rhz56UHcQv1t6uA7f5fNMM4W3uDYj83vpWwpR3McoNAvor+zJ
         ro5g==
X-Gm-Message-State: ANoB5pk9vVbBnWkr9xr/rdBZ4dWmqYwTQ9Bn7ezSjnKGcE8MxpvxA5Ud
	570WRya2sBOTNL4WjKB0+3vBSl/FHlf2ePYK
X-Google-Smtp-Source: AA0mqf4dzOHHSAW1WMc/oAghOpU7AhOuwVxrxnUxPOd7tlABGvh5lka4F6i0MMOJzd3sn8wJ7DYv9g==
X-Received: by 2002:a05:622a:1995:b0:3a7:242:4f3 with SMTP id u21-20020a05622a199500b003a7024204f3mr12161883qtc.66.1670620263881;
        Fri, 09 Dec 2022 13:11:03 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id a19-20020a05620a067300b006fa4ac86bfbsm636782qkh.55.2022.12.09.13.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 13:11:03 -0800 (PST)
Date: Fri, 9 Dec 2022 16:11:02 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vishal Verma <vishal@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep + prefix handling
Message-ID: <20221209211102.qeyyon3mxztcn2lx@meerkat.local>
References: <a68d5dc1c7919b16062fa1c477cf12b5c924caa7.camel@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a68d5dc1c7919b16062fa1c477cf12b5c924caa7.camel@kernel.org>

On Tue, Dec 06, 2022 at 03:44:59PM -0700, Vishal Verma wrote:
> Hi Konstantin,
> 
> I found a possible issue with prefixes - and also a suggestion below:
> 
> - When a 'git config format.subjectprefix' exists, b4 send does
> something unexpected:
> (the .git/config subjectprefix here was "ndctl PATCH")
> 
>   | Subject: [PATCH 2/2] [ndctl PATCH] meson.build: add a check argument to run_command
> 
> - It might be helpful to configure whether the final form is "PATCH
> prefix" vs "prefix PATCH". I'm used to the latter, but I don't know if
> the former is considered conventional.
> 
> - It might be nice if prefixes from git-config could be added
> automagically (perhaps b4 prep pulls these in when starting a new
> set?). I have prefixes based on repos sometimes, like the above
> example, and it would be nice to get consistent behavior regardless of
> whether 'b4 prep/send' is used or 'git format-patch/send-email'

Vishal:

I believe the latest master should be able to properly co-exist with prefixes
set via format.subjectPrefix and those set directly via b4.

Please try it out and let me know if it's not what you need.

-Konstantin
