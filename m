Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.2854.1614627917690786233
 for <tools@linux.kernel.org>;
 Mon, 01 Mar 2021 11:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cImXu8gz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.171, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f171.google.com with SMTP id b130so6208819qkc.10
        for <tools@linux.kernel.org>; Mon, 01 Mar 2021 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7FTvHuXtgZn6JvORTC1Hp1g+gmipxS7ew8owUr7M4L4=;
        b=cImXu8gz4cpEb0UuGRjtWCcE1UL8vR+bWy+uTnd2t84H0Ew1cUMMVzaGP5dqajw166
         TOQtwy49uTLfpCrrylHD5RTJ3zYsklO8oFZh6OwHaG50yBeIMXY9VhWNxJCY4PVP3GUl
         TtGHmZhnNXtX0cu1JlvP0t1Uq9CDiD3UVNLys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7FTvHuXtgZn6JvORTC1Hp1g+gmipxS7ew8owUr7M4L4=;
        b=r4feVuw0ey/+D16xrE2oPGK9dsObNuA6EsfpOFMEgKr5ZbFjN5LQNmoUxW1vYQz80J
         m6sZw8RnnD7wcL7I9nzRaCkmfohcIeQSvasjpDB9v9p2PMHkGmQ38IYDz5HwPaOr8JTD
         oDoU9wfpZ8M+hmsdZrn6FTYlXpHIWYfKc+zEmtovVbzSf9EWYQqyAheHR9abG7aiTs9e
         V/lL8GZsyrMwI9bH0VM1apzO1WJFhsJbgZL9cAmuclNPyVvJb8UVbL1Wbo2jZcQuEoS/
         SsEvYnZQcZ9ukUndY3KvQS9YJK+gR5w43iNRN3vtMl7DqFdQBxvPKw8BqjFPSVdQ5Euy
         FIPA==
X-Gm-Message-State: AOAM532+AeAzHzwoTPYD5B8ShN5j/Y15fcxxoUoD9QSuo0VUpV3ewgPO
	f4Q9+KCOoMHRJC6Tqshq2xsUQw==
X-Google-Smtp-Source: ABdhPJwK9pGwUNSyblpN11fCMmChBedFCLyLRKp8dAI28XOyD+SPuwG9MxJbu2gmbcmj2fRlzRit+Q==
X-Received: by 2002:ae9:edc1:: with SMTP id c184mr14607422qkg.453.1614627916650;
        Mon, 01 Mar 2021 11:45:16 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id f27sm7217015qkh.118.2021.03.01.11.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 11:45:15 -0800 (PST)
Date: Mon, 1 Mar 2021 14:45:13 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Kyle Meyer <kyle@kyleam.com>, tools@linux.kernel.org
Subject: Re: [PATCH b4] Loosen compatible release identifiers for install_requires
Message-ID: <161462765924.1338541.17855550955663212424.b4-ty@linuxfoundation.org>
References: <20210226042557.19210-1-kyle@kyleam.com>
MIME-Version: 1.0
In-Reply-To: <20210226042557.19210-1-kyle@kyleam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, 25 Feb 2021 23:25:57 -0500, Kyle Meyer wrote:
> The install_requires entries use a compatible release operator.  As an
> example, "requests~=2.24.0" maps to a requirement of ">= 2.24.0 and ==
> 2.24.*".  With the current version of requests (2.25.1), this leads to
> a ContextualVersionConflict failure at runtime.
> 
> Allowing only Z to tick in version X.Y.Z seems unnecessarily strict
> unless there are known problems with a particular release, and it
> makes it more difficult for distributions to package b4.  Drop the
> trailing digit from all of the version identifiers, allowing both Y
> and Z to increase.

Applied, thanks!

[1/1] Loosen compatible release identifiers for install_requires
      commit: 31348a14afdb1d39e7faf9576eaddea1ced76e19

Best regards,
-K
