Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6853FCB
	for <tools@linux.kernel.org>; Thu, 26 Aug 2021 22:41:55 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id c19so3867289qte.7
        for <tools@linux.kernel.org>; Thu, 26 Aug 2021 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KbaN/GlCHUSCiurk+OxDNMtdhpojShgafXYni6Be8Os=;
        b=YFzx9u7RQwqZ09uiNfoE+ZP+AB5j+D03eOu/MQ/X5L2SrWQ9V6m8vKb8toxjoQFHqH
         BGqBuKrlyul1lteiS4TjY/vWk/vgGN1kf4p4aJnzLh2to90u1w4cIsnh2BUZSroc8qK3
         h/9lfI1AMLSxBMzVFcr3duh5pKenpo6RoiBbetAc8mo9IIlI8d8s1vrHMk41k/vjNpxM
         WmlYFC73ZM3gCulx/Kp/8SH7YIXo98k7z0bV7aYKlStPFyFKrFECWXGYTCdnPxVu71Xn
         Op65wkzg0B+f1KQ51yaOczQg50nynyAJLhnPevA2/mHDPkofDUa2TloLS/a0BmR9+5nm
         bH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KbaN/GlCHUSCiurk+OxDNMtdhpojShgafXYni6Be8Os=;
        b=K6Gw1OnA3uNO8v0z6YUZJWnzWjq8E2wm/us/LlhzFmIkW4Wo1JXkDNEMdZM3lNxs39
         IyUTs0dDt9FjISvgR4s1hIBju8vcHvQ3L0wz+cnYzcHeXdXAOBrRuC+bQYe6CHdq749J
         up1r5ZhywKtpWcj5gXBT4bUG7bdy8JuTyPkScJyTPsHbPJYnF2KjJcL9Vng1zrXxu5kx
         Qox8xklz9W0dnM42LLvz2m8cYhotTx/ntn26pxYB+KuuvHUd2x2p+ynOmnJhKxwuBu9W
         xEIW1NbAMA8uoc4DSBkH+K/jjiQaHO6oG7v9mYNqObjFHyum/X4LvPO2DsYuP8roy+bM
         ln4g==
X-Gm-Message-State: AOAM531xadVuAZGxETPxUhqN/qj1rb1F/XAFeCOGOUIkGOsKh5eRWqqu
	WZNfFTHj+PodV0hMpUi0Y2cMHcfIxNA=
X-Google-Smtp-Source: ABdhPJwujCR25Z3zJJs4rvM/9xiyQeqHg9AiJcGwxmjDF+cU3gtDuVpo1h8oqrkZtNXUMcDPSRNBrg==
X-Received: by 2002:ac8:7352:: with SMTP id q18mr5758814qtp.5.1630017713712;
        Thu, 26 Aug 2021 15:41:53 -0700 (PDT)
Received: from [192.168.1.127] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id y15sm3605346qko.78.2021.08.26.15.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 15:41:53 -0700 (PDT)
Subject: Re: [PATCH b4] Reorder headers for `git imap-send` compatibility
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <20210811024132.8496-1-levraiphilippeblain@gmail.com>
 <20210826194039.e2i3tpfaf3cgvsyy@nitro.local>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <1b827c91-21c1-1d49-c048-9a317a03ca90@gmail.com>
Date: Thu, 26 Aug 2021 18:41:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210826194039.e2i3tpfaf3cgvsyy@nitro.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Le 2021-08-26 à 15:40, Konstantin Ryabitsev a écrit :
> On Tue, Aug 10, 2021 at 10:41:32PM -0400, Philippe Blain wrote:
>> When downloading messages from a public-inbox instance, reorder the
>> "From", "Date" and "Subject" headers in that specific order. This allows
>> the output from 'b4 mbox -o- $url' to be piped to 'git imap-send', which
>> expects these headers in that specific order.
>>
>> An easy place to implement that is in 'mailsplit_bytes', which is called
>> by 'get_pi_thread_by_url' and already loops over the messages in the 'git
>> mailsplit'-ed mbox file to populate the message list.
>>
>> Note that 'mailsplit_bytes' is also called by 'get_msgs' directly when
>> piping in a local mailbox, i.e. when '-' is used as the value of
>> '--use-local-mbox', but it does no harm to also reorder the headers in
>> that case.
> 
> I've decided not to take this patch because it will rearrange headers on all
> processed messages just to work around a deficiency in a single tool
> (git-imap-send). The order of headers in an RFC-2822 message should not
> matter, so any tool that expects them in a specific arrangement is what needs
> fixing.
> 
> Furthermore, reordering headers may actually cause DKIM validation errors in
> the case where there are multiple From, Date or Subject headers. I know this
> sounds contrived, but I've learned not to consider anything too bizarre of a
> corner case when it comes to email.

Fair enough :)


> For your particular case, I suggest you simply make a tiny python command that
> takes an mbox on stdin and spits it out on stdout with headers in the desired
> order, which should be about 20 lines of Python at most. This way you can do
> `b4 mbox -o- $url | reorder.py | git imap-send`.

That is what I'll do!

Thanks, Philippe.
