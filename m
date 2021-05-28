Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400856D0E
	for <tools@linux.kernel.org>; Fri, 28 May 2021 19:38:38 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id i12so3519793qtr.7
        for <tools@linux.kernel.org>; Fri, 28 May 2021 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JFw9/J8FtCyGUUV++NstSqNDkxQk5raNhIs2q/yg3BY=;
        b=ZVLJO6OtxKk5sepeCnvUDv6tEhKQfwUrRMcLcoyJXjrOBSpWaGaOV+SBpMpahpfBJB
         WABb2tILwoBmx3JfQh4ZL3GnJ8MEOqJUuQUMduicY8P1P3LcMs07/+QaXcBMzt3lf/dr
         O/pXj8GahXYuQowrXO23Rd8rkBGgC9vppFNKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JFw9/J8FtCyGUUV++NstSqNDkxQk5raNhIs2q/yg3BY=;
        b=X+SyEJoq72bnHqjk/RDjUY/6nLUUI0UZFDbNDkNvGPpXnk30by9yUKFeH86TSvq10r
         RDHne+rRkHDLuefQFCXKA6bVxhwrK8unt8tDQAtfvNJHh4R8+d03vLtDW7ENnAl7ULVy
         FRXtjlkPdayEvdrvGJLWsquYKEc33oRoFjXBxcU9xK3wWVAvvvw16da0WlTPHx7Y6LeF
         7p1gFXS+P0L+WZG4h53dhMogg3XjDpXDKNhDxCMvPpbjuuGoumo31xbd2SQgeYpYGbdJ
         U0XBwlvU3uVGQATtEzI/tqgjg3hrzgGVBYCGwMgVbPc2h0WjzO+XAIdnCz+/p3HgjU+A
         UYZQ==
X-Gm-Message-State: AOAM532w3LjxZyd1AOUHbGkp5YT/SQ0GR07qXlamQFaOVkemxJmE4X7W
	/ZWzXwMiWgPOPvsYPQAkUwSVkg==
X-Google-Smtp-Source: ABdhPJyjt/rRrVZMnjoSDKTPI9oU/2avi6uH16xDfm7NO60ZjvcHDDsMi0TAe3O+DV01n1wYEbI4Jw==
X-Received: by 2002:a05:622a:1005:: with SMTP id d5mr4864250qte.0.1622230717120;
        Fri, 28 May 2021 12:38:37 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 123sm4106660qkh.104.2021.05.28.12.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 12:38:36 -0700 (PDT)
Date: Fri, 28 May 2021 15:38:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: grokmirror and pi-piper for all emails on a list
Message-ID: <20210528193834.mwf6qvuw6wng7yoz@nitro.local>
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>

On Fri, May 28, 2021 at 12:14:56PM -0700, Luis Chamberlain wrote:
> Dearly super-duper admins,
> 
> I just read for the first time:
> 
> https://people.kernel.org/monsieuricon/subscribing-to-lore-lists-with-grokmirror
> 
> And I am extremely excited. After trying it, it seems to work great!
> Just one thing, say I want to actually get all emails on the archive
> to be run through .procmail, how do I do that? So that it would seem I
> subscribed to a mailing list from the very beginning? It would be cool
> if I could do that per mailing list. For instance, I want to enable
> that for all my mailing lists except lkml.

In each repository, you will find a file called pi-piper.latest. If you set it
to the hash of the very first commit, the next run of pi-piper will replay all
of the messages (may take ages, you've been warned). Note, that if you
configured pi-piper to reshallow the repository, you will need to unshallow it
first (see the article you linked above).

Also of note is that the upcoming "lei" tool from public-inbox is going to be
a much more robust approach to doing what pi-piper does. I really wrote it
mostly so we could feed lore lists into patchwork. :)

Best regards,
-K
