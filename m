Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484832FB9;
	Thu, 27 May 2021 12:05:43 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id f9so231117vsp.6;
        Thu, 27 May 2021 05:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wx+rN/+SAmpgy0NcR4zDYPGGwAkKwx9nbdaFRCSfEGY=;
        b=VtYtFeXi3CPn7TjvzDPjHhgJxzjikAGQ9IsO+2rcvykAHqFYPyBEqKj9ht45OB8oS2
         b8IM++1EWKuxNsT6LRC1vXyvg2NmefiVFq2iML9fCRDZz7cikaoQINfOJmj4ywEPhlgQ
         ylD5rkagah54V/qZi2xIc+Kozhhvw6t8RDb9wJbPlUjiSOKLRqxVhXAvhoZwNslDg1jW
         3WvBaOKBWM88gxJSSTtgwS4slekSaWzWqh1S8dU0gVXGew9yNj/JYPsH9xqo4BY5HjkF
         yZAtAbuFYHLwRupiHQ3TsPRa8XUjolykYSi8NObekDn3Eo1ztSk+kFaabSPmU+JDIAXF
         q3hA==
X-Gm-Message-State: AOAM533e19TNButWHp2GV0cHpOj7fUaYVx4uXvo+975dCi1oMrQHqUWI
	GSPbRuYfbmYdJaEORCasRlBYHFZ7lHas5LDr55w=
X-Google-Smtp-Source: ABdhPJwr4DRh9JrQJv8Jq5Gfbk91fh2FX3PWMNY83q8xeqJzZjUiSHzYFhywcx5VtkHrUpQWF+GgDzg26Q9j/b9rnTw=
X-Received: by 2002:a67:4386:: with SMTP id q128mr1857868vsa.40.1622117142275;
 Thu, 27 May 2021 05:05:42 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local> <CAMuHMdU5vyhHOZ7x-3d0uQqD9kSLBztaKBt9yq+pNGTmATHxCQ@mail.gmail.com>
 <20210527120021.o52btp5tikzj7wnu@nitro.local>
In-Reply-To: <20210527120021.o52btp5tikzj7wnu@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 May 2021 14:05:30 +0200
Message-ID: <CAMuHMdUyctKCMTT4rFCktPfqPZHpnzMt6xDXsxvb7sYj0mH4Zw@mail.gmail.com>
Subject: Re: b4 v0.7.0 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Thu, May 27, 2021 at 2:00 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, May 27, 2021 at 09:56:25AM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 26, 2021 at 9:26 PM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > > - b4 am will warn when it finds a message in the thread with an
> > >   "Obsoleted-by:" follow-up trailer. Running "git am -c" will automatically
> >
> > "b4 am -c"?
>
> Yes indeed. Sometimes I wonder if naming it "b4 am" was a good idea, as half
> the time I type "git am" when I meant "b4 am" and vice-versa. Brains are
> terrible.

Glad to discover I'm not the only one doing this ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
