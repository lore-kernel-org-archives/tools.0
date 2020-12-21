Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.538.1608577410589093941
 for <tools@linux.kernel.org>;
 Mon, 21 Dec 2020 11:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VRDim/GW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f170.google.com with SMTP id d14so9710003qkc.13
        for <tools@linux.kernel.org>; Mon, 21 Dec 2020 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gj3paraXZcBvz6s+X6UOZvufHPxWbQS9RwF7R6dHqJs=;
        b=VRDim/GWuIN0ygAsKhdT30QcX+NmzEYMqOiz3GZJPBp57hqkJ18uQFTNpsVYHr8HhP
         zEnx2T87h30m8T4iSDSjasvK/C1H+H1Obttt2mzdubhJDS+bhgJlJM6Gb4CLSW0dVVtw
         5lwshX7m88e7N2wvhE9ZsW/aVRwMAtqlviBLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gj3paraXZcBvz6s+X6UOZvufHPxWbQS9RwF7R6dHqJs=;
        b=tsrgwE/5KSuU/FirLraPWDratqSzhJdTIdlj/Yi59qWzZ3gHLHL4co2qGAcy4pcPwg
         r8JEH0ER7Zv7KHIC123FvMHUvZ/2tGkbwIMTQJto5QyTZhEsqueRo0w84xo18usWcEel
         0ULuLDs71LX5aY5F3d8IMxBaPBn7mNKUkSUkuCl0q59GiLTZWaeAVTUKqza5brIauJuA
         hmTvGy83xHIfuHC0+uass7ZQi8sxMX7T0LRx2si4Lm7ZKvmKIJ5kM4U9kuCGprKSUP0y
         tGbXfzJIdTpbbA82i2T6/xQkN7MzpLHrYoimiwFa/G+tO9vr0sZKlZO4nQkjNupSaVg5
         5SWA==
X-Gm-Message-State: AOAM531rKtzMyxi5cEW1gG8Uue676Hw3n6DV+gMeN3uvrDiJwALn4eMH
	tUmQ9xxrRyRBxhs+AhyELwsqXhc/wumuPKof
X-Google-Smtp-Source: ABdhPJxlWRaBd4y11qUm7+iKs5C11p1PV9x/nk7cM1QpZe6XyC4pA6R+4sUm+1+7kapsit/rQZQAxQ==
X-Received: by 2002:a37:a158:: with SMTP id k85mr18376310qke.432.1608577409409;
        Mon, 21 Dec 2020 11:03:29 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q3sm11594488qkb.73.2020.12.21.11.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 11:03:28 -0800 (PST)
Date: Mon, 21 Dec 2020 14:03:26 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: Re: [tools] [b4] make 'b4 mbox' reorder headers so piping to 'git imap-send' works
Message-ID: <20201221190326.vdqjsqqdrq3atboc@chatter.i7.local>
References: <7e6329fa-e5fa-c5af-002d-a8fbb60e0724@gmail.com>
 <1652CA1A4BC02C6D.17984@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1652CA1A4BC02C6D.17984@linux.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 21, 2020 at 12:03:47PM -0500, Konstantin Ryabitsev via linux.kernel.org wrote:
>   b4 mbox -o ~/Mail [msgid]
> 
> This will add all messages from the retrieved thread to the mail spool in
> ~/Mail (assuming it has the expected {new,cur,tmp} subdirs).

I just added a -f|--filter-dupes flag to "b4 mbox" that will check the
existing maildir for existing duplicates before adding messages from the
retrieved thread. This allows neat things like retrieving the rest of the
thread directly from mutt. If you add the following to .muttrc:

macro index 4 "<pipe-message>~/bin/b4.sh mbox -f -o ~/Mail<return>"

(obviously, use something other than ~/Mail if it's not where your maildir is)

This lets you hit "4" in the index view to retrieve the rest of the thread for
the message that is currently selected (or tagged). Handy for when you're cc'd
in the middle of a discussion and want to grab everything else for context.

NOTE: -f requires iterating through the entire maildir to collect existing
msgids, so it's not recommended for huge maildirs.

-K
