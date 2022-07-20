Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2297B
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 18:48:38 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id o1so14367780qkg.9
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 11:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nMfst/SFkyvP3GDnNf/Vhd6mCR3L0SG7rJln3yrTBRc=;
        b=bY6aAHSHgKmJUEwgtVFnkqXXciMTpL/QkmhJsNp3ColT/0IaxN2F9p6xftjO7vKTHn
         Tq6lMLMkBkbn+tC+38JEj6IpIq4UXveAjZ74SmM+msutWZ+EA2POG074W61LCmvnkP+W
         fKdeSyvSOCAkwp0gDafddBdhI1CxaR0jiBZ4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nMfst/SFkyvP3GDnNf/Vhd6mCR3L0SG7rJln3yrTBRc=;
        b=6+l+iuIncKEJ4MTll/BaTziE/+PN6/CLT9uprpLcrZJ09QajgMK0dRjw8cfQeq+xuH
         VxDeJ+HZR9B45KbWBJhYK2igOUqLuk12rVMvDZymBxaBRNdSiK3wG2kAMTWbnStNOztX
         TCodTn7IMPLwcUfaeBErWpi/JCXGuOMT0Nkg6sO8up5eSSetbeBMLhF3pRjtnwg6onJR
         rqlWcbr/7vq9r/e6jNgbMaitI+5328AU5KrrlWwQEODBp4Lx9ZtG2IO5YN9hZnJ3x3Dw
         ywsHn8Iz/XiBA+NoXE3sn4u9zN19Rl6fNCj+bPV8FMNciUpWBr3Sr7/fTFTdboTSUqF3
         xY8A==
X-Gm-Message-State: AJIora/Re5El/K6kqMToF89DhZkZS9Nlp9QLGBTPu0ZnXcw3c500YDdB
	ZVpSn9yduNaNO3LNsjFaK/PnT0T58EXKaA==
X-Google-Smtp-Source: AGRyM1spE6FEY4QK0Rx6vxU4Towh1mXJK0OI9ARqYPbbkR5bYuZbQpmbnNpI6yJbT+3c0TjxGAFNnA==
X-Received: by 2002:a37:65c8:0:b0:6b6:de7:4366 with SMTP id z191-20020a3765c8000000b006b60de74366mr3476009qkb.776.1658342917398;
        Wed, 20 Jul 2022 11:48:37 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id c26-20020a05620a269a00b006b5ba7b9a6fsm16492788qkp.35.2022.07.20.11.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:48:36 -0700 (PDT)
Date: Wed, 20 Jul 2022 14:48:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720184835.uhnkucai54alhgo6@nitro.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>

Hello, all:

Based on your feedback, I've refactored the submit functionality and it's
ready for some more poking and testing. Here are the implemented changes:

1. Pluggable cover letter strategies
   The goal is to support 3 different cover-letter strategies:

   "commit": same as first implementation with the cover letter stored in an
   empty commit at the beginning of the series.

   "branch-description": stores the cover letter in the branch description
   (which really just means the git config file). The cover letter can be
   edited using the same b4 --cover-letter command, or just with "git branch
   --edit-description".

   "tag" (not yet implemented): will store the cover letter in tags a-la
   git-publish.

   The default cover strategy remains "commit", but you can switch using
   b4.ez-cover-strategy, e.g. in your ~/.gitconfig:

       [b4]
         ez-cover-strategy = branch-description

  Note, that switching from one to the other for existing tracked series is
  not supported (and I'm not sure will be). It's also not currently possible
  to enroll an existing branch into ez-series with the "commit" strategy
  (because I haven't yet figured out how to insert a random commit into
  history with git-filter-repo, but I'm sure it's possible).

2. "b4 submit" command got split into 3 different commands:

  - "b4 ez-series" to create/enroll branches and manage cover letters

  - "b4 ez-trailers" for retrieving trailer updates and updating your local
    branch. Note, that with -F this can run on any branch, not necessarily the
    branch managed by ez-series. E.g.:

        git checkout arbitrary-branch
        b4 ez-trailers -us -F [arbitrary-msgid]

  - "b4 ez-send" for sending the series to the mailing list. It has all the
    same flags as formerly for "b4 submit", e.g.:

        b4 ez-send --no-auto-to-cc --dry-run

    There is no more --reroll command, as using ez-send will automatically
    increment the tracked revision number (unless RESEND was in the prefixes).

    There's still no support on the web submission endpoint, but it's coming
    in the near future.

Thank you for everyone's feedback, and please continue testing it out. If you
want to test the dev version of b4, use the same instructions:

> ## Getting the b4 dev version
> 
> To install the b4 development version, you will need to run it from the git
> checkout:
> 
>   git clone https://git.kernel.org/pub/scm/utils/b4/b4.git
>   cd b4
>   git submodule update --init
>   alias b4="$PWD/b4.sh"
> 
> You can find out more details in the README file. You will also want to make
> sure that git-filter-repo is installed (either from your distro packages or
> from pip).
> 
> If you're already running b4 from the git checkout, make sure you run "git
> submodule update" to pull in the latest unreleased patatt version.

Best regards,
Konstantin
