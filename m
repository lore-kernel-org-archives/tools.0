Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.28685.1585493688344747287
 for <tools@linux.kernel.org>;
 Sun, 29 Mar 2020 07:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qK2dUg8L;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: linus.walleij@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id p14so15104709lji.11
        for <tools@linux.kernel.org>; Sun, 29 Mar 2020 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H66464FMVLmZDh7Uzh57n9huMuz/2j0ERJF5SIc731Q=;
        b=qK2dUg8LHJDdcESVhEpfh5OMDHlpYBhqQckXB3ZPmnlWTSTraZ62020HpUGRowyWdi
         tf2sqhI7EVo8ts/8lfFDeK9u63/Jy+UxnT44LIigdiZjjsCUTC82HyHY0keznLkxjOlb
         LvWwbLOhCjO0+8kfx2GbSdl7hjtNJs0P+TbzQmhxbQWWH9k3mMNvKHB2q4OUcDUqoTzC
         zQYHHR61TH3o9rcCwwyoJpJltidGe4+BRYokQDOBY2bhOrc5hQz2Vb07j/1s5oC+dIn1
         w2XPG0E6N7qne5W0NBu4gH7UfpBGLWt/bKiIOn0EWC2jeI/OmPY1QbHRu6Gdv07GWLMv
         ONfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H66464FMVLmZDh7Uzh57n9huMuz/2j0ERJF5SIc731Q=;
        b=ZXWooLH1E3VPVEzMbUSnnkgSkIntxV9p+bMa54l902vW/fCYOttvaUXajQm8yjLavk
         dEvswDsM2Ti4mhpGV4Qvx0vho1dEdFvkCoumsAHf1+TACXMsTma7pi5C7fhOFPaHrL6Z
         VzhJRpSeHyPc+NnVzKEvpGgbNXql1ZDHSEbghGYN7MNYlMuUJTu1giG5CwQwcuT99pqY
         oTYccp9LcA/3dlZ4DuPC44Ww30Wwl8AdnZdXa/kObsO3WMEQ+kEwG6tzV/RrrvHuN0/A
         /lshcQ4HGybfXeaeqalcxdyEW3R1QXsqsysYcBLk/YU97z1Ad8wGV+ZE1rn2hqbfYHcS
         pyfA==
X-Gm-Message-State: AGi0PuaOACyPV5BkHSgMMRAICVZI0nA2wr8ISxYQNMvVQ7Ls9c73SikW
	Iv/XYKPjoNP3rzrFvHuOI3xVLpH8JGoSrTr2PK4E6A==
X-Google-Smtp-Source: APiQypISba6WyVVGweNBOB0TU4W127SuAORT0A7M2Y1CrehIg662zZjJLV/ge9xgh7aGPw3a4HgEqGiMWMgAEIqLCls=
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr4865521ljo.223.1585493686452;
 Sun, 29 Mar 2020 07:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
In-Reply-To: <20200327165402.slc5l46hc7hlo2l5@chatter.i7.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Mar 2020 16:54:33 +0200
Message-ID: <CACRpkdZRXh8gKEyeF-uwnP+GuBWxj_QGHeEL=dDOSMoKx6G=1w@mail.gmail.com>
Subject: Re: [kernel.org users] Gmail message ID finder Chrome extension
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 27, 2020 at 5:54 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:

> If you're a Chrome and Gmail user, you can try the following extension
> to easily get the message-id of an email without having to "show
> original" and hunting for the right header:
>
> https://chrome.google.com/webstore/detail/gmail-message-id-finder/comcoiiifldaaejpbgbincdkoohihbae
>
> The message-id will be copied to the clipboard with the "rfc822msgid:"
> lead, but current versions of b4 will handle that properly.

Actually, but I don't know if I'm unique in this, for my workflow
I'd ideally take that thing a step longer so that the drop down menu
simply had "apply patch" meaning it gets the message ID,
calls on b4 to get the message, and applies it to a certain branch
in a certain local git tree with --signoff.

I anyway use gmail's web UI to read all mail and keep track
of what's processed and not by whether is is read or unread in
gmail.

Are these extensions to say Chrome hard to write? I think
if I wrote an extension like that it could save me hours of work
time, but maybe I'm the only one. I tried to find the source code
for the above extension but no such luck.

Yours,
Linus Walleij
