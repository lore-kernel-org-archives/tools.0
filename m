Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1E2101
	for <tools@linux.kernel.org>; Wed, 12 Jul 2023 18:33:28 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-635f293884cso42729216d6.3
        for <tools@linux.kernel.org>; Wed, 12 Jul 2023 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689186807; x=1691778807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3FVh1KvTyMZ2oEgNbQ+g3eggEO3993GQyTE8eLsjLw=;
        b=QAO778ET8Ssh57xRUB0hAi4mRojcUVOn5nFGM4A+VVQsmj9HM6rGxegVS/MUW7wacL
         KiDZSQTWnJkVfWFjE+jWJ/ULE8oMKdnAfPxBaJelbVx2MT6r18uy/XKnxEzGtU3z25Dd
         wULGmm1SmZPhcuJGjnGLMnvU4KrDOfQOpGHII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186807; x=1691778807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3FVh1KvTyMZ2oEgNbQ+g3eggEO3993GQyTE8eLsjLw=;
        b=XlKpaLq/OUAIT4+GJLBUIc04jEnSgon0AsINdvmRt5BFvezvFdF+W4QCUT6GoAOP2J
         s+rJRZTlWPTPzUSOcygQsOnTMMiVcUR6fW+XROl9ZwpCRT04o2th/Rr5BNmVeHJ8bDqj
         lRVgFC0Y0WDLwlKdUtGBwaI8vRwCnFJOMHDs25Lslgkc5Ypcl2gTIEjOWxqjH6CV1jGI
         ICXu84CaFqIuJvoPym7Kb/E18gZ8ya6BrWShl5h0DYO2WX6JsbQHjovUULWW3EARzwE4
         KaoAR8kLKGBVwt1ohH0asOB1XrqXWm8voZfkQshnlFuhPwSdacIYAtfrdIRTMOloLC3C
         979Q==
X-Gm-Message-State: ABy/qLbnBpwyP7c9HfZYidS4BRA7zbODG+iGSTCVb7gHgA6nb1xgkZ9j
	RoLJ8RA23crlkHbvpWo9ENbQQsbUR0ueU/Ec+MQ=
X-Google-Smtp-Source: APBJJlFebrUARTvvwnJPdRTZwMPPshUAsxpR6dmVhFvvyWXZWomBFPOzeqCjtc85NgePtnC56enc1A==
X-Received: by 2002:a0c:f443:0:b0:636:668e:7e6e with SMTP id h3-20020a0cf443000000b00636668e7e6emr16665936qvm.45.1689186807655;
        Wed, 12 Jul 2023 11:33:27 -0700 (PDT)
Received: from meerkat.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id c3-20020a0ce143000000b0062ffec0a18esm2394965qvl.84.2023.07.12.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 11:33:27 -0700 (PDT)
Date: Wed, 12 Jul 2023 14:33:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Picking up changed commit subjects when generating thank you
 messages & patch list generation
Message-ID: <20230712-mulch-french-2788cd@meerkat>
References: <20230711-berechenbar-bordstein-b22e1f7f9835@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230711-berechenbar-bordstein-b22e1f7f9835@brauner>

On Tue, Jul 11, 2023 at 12:05:44PM +0200, Christian Brauner wrote:
> Hey everyone,
> 
> As always, very happy about b4!
> 
> I have two features requests:

bugbot on

> (1) Automatically picking up changed commit subject lines
>     When applying series via shazam or am commit message subjects
>     sometimes need to be tweaked afterwards. But while b4 ty picks up
>     commit hash changes caused by e.g., git commit --amend it doesn't
>     pick up the changed subject.
>     
>     For example, the patch originally sent with commit subject "aaa" got
>     applied. Afterwards it was amended to "bbb". But b4 ty would still
>     generate:
>     
>     [1/1] aaa
>           https://git.kernel.org/vfs/vfs/c/7b2edd278691
>     
>     in the thank you letter.

I can see arguments both for and against it. Since we are responding to the
original submission, it makes sense to me to use the original patch subjects.
However, I will consider how to best approach this situation.

> (2) Let b4 support generating a patch list for a specified range of commits
>     Sometimes there are scenarios where it would be helpful to let b4
>     generate a list of applied commits for a range of commits (even if
>     not under direct control of b4):
> 
>     [01/92] subsystem1: long
>             https://git.kernel.org/vfs/vfs/c/ead310563ad2
>     [02/92] subsystem2: long
>     .
>     .
>     .
>     [92/92] subsystem92: list
>             https://git.kernel.org/vfs/vfs/c/f42faf14b838
> 
>     that can then be copy-pasted into a ty message.
> 
>     b4 has all the nice info and gitconfig options such as:
>     thanks-am-template, thanks-treename, thanks-commit-url-mask that
>     would make this just ultra useful.

So, you just want a "summary of all commits" from an arbitrary range, using
the template? Do we leave To/Cc fields blank, or populate them with all the
addresses that we could match either via b4 tracking or via commit trailers?

-K
