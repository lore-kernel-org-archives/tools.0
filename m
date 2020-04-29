Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.1864.1588183293131383284
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 11:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=Z7sVYtnr;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.195, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f195.google.com with SMTP id o10so2655908qtr.6
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QZqcxvoBXVk9CbbJA2BXfIMHICoHBZhlogfZTw71f3I=;
        b=Z7sVYtnrW6W311mpkXQurFKtA3xRnHym9wTmQb7AmZWPwJL50zrl+COZuSIVVnBlEw
         uU0IkxGQNjqEsNm9eztrKQHMH/b7FoznBaL5ohDjG7s2UH19IK4ySCzL8CVutIg3nPJY
         vYCe9b7lNdRPZ9KY+JOlWUlqbzTlBCyb4UxQso++uMkSs7faPLvhbY0+yGKfIhIBlHRE
         21EFrz/bP0WIlWvjPZKvUDyoCEYptgxwX8v/aBKFynxFkr7exQgd7HG6DXng6Lmo5rnq
         Vq76BTJ1AMIYIXjuYaI5jo/6+i3wY8E9lK+6RXSIMFQozGWGEJrv4gc5VrD6qkUadXuu
         fjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QZqcxvoBXVk9CbbJA2BXfIMHICoHBZhlogfZTw71f3I=;
        b=C2cGH8lI886LKr4TVaAQTguKJt4FW8XFB7JP/PgxXIeI7qdJf9rJM+ILBhMkoCfleN
         8uJt0dghXQWw5+lN67BReizjhR/qp4D7w3tLEdpG+OPj2jX+lI5JLMEZ50F+x0wNim/C
         VQa8HQybAhw/RvDBgy7R4J+VHYakZGyv/QjaxkKPxwZtC6IZF/fK0cQvWAZ2M6Ihh2+A
         jNJm5yMPhHE57q8VWKFFtE8Bmpmeq7dqssAjFJWxkdaeuLI5qXHZW6JQVHjYpe0GcvlK
         oFX4lPV59ZcmVuuiPWXmF7KPoexEQlQqCxh4LYTAyD2o8NM6Ui93vwu4lOnMB7R6bn8s
         2hEg==
X-Gm-Message-State: AGi0PubLfQuH14VQdSLjSzgD0wQlpNYLKNUAmlicYxUtHBxTIUctcZ7l
	Z6GreptjY1hn/+8bNsR9vDpxlzqy3kc5VQ==
X-Google-Smtp-Source: APiQypJZKnJpWM7e6q5QG3HhIkRtNR1Uouen00L6CXQdadTOQYkZWsRCLgLUL0md+LlysgJINHAw7Q==
X-Received: by 2002:ac8:4cd1:: with SMTP id l17mr35407811qtv.20.1588183291630;
        Wed, 29 Apr 2020 11:01:31 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id c6sm15929484qka.58.2020.04.29.11.01.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 11:01:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTr1W-00019h-MY; Wed, 29 Apr 2020 15:01:30 -0300
Date: Wed, 29 Apr 2020 15:01:30 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [tools] jg expand-am (Was: What is a useful way to show changes between series?)
Message-ID: <20200429180130.GI26002@ziepe.ca>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200428195555.GY26002@ziepe.ca>
 <20200429164107.lc4sezzibjocwxgo@chatter.i7.local>
 <20200429171540.GD26002@ziepe.ca>
 <20200429175820.bydzqgxmbc5k65qt@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200429175820.bydzqgxmbc5k65qt@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 01:58:20PM -0400, Konstantin Ryabitsev wrote:

> Ah, this is a pretty neat hack. It would be fairly easy for b4 to do the 
> same thing if we're running "b4 am" inside a git tree -- I'll see if I 
> can add that in as an optional "b4 am -3" flag.

IMHO it should be part of git am, a --rebuild-blobs flag or
something. git am -3 doesn't really work as intended without this..
 
> Getting back to the original topic, I now better understand what you're 
> suggesting. We perform the exact same operation on two different series 
> (v1, v2) and then perform:
> 
> git range-diff <dummy-base-v1>..<dummy-tip-v1> <dummy-base-v2>..<dummy-tip-v2>
> 
> Assuming we were able to find all the blobs, this should effectively 
> allow us to range-diff across arbitrary patchsets without knowing the 
> base-commit. Neat.

Yep

For the purpose of range diff the files outside the series can be
ignored.

Jason
