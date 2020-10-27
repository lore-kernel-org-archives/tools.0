Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.13392.1603803119291993570
 for <tools@linux.kernel.org>;
 Tue, 27 Oct 2020 05:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZEuYk+kE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.170, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f170.google.com with SMTP id x20so969789qkn.1
        for <tools@linux.kernel.org>; Tue, 27 Oct 2020 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BLMaulvoKzFcRGTn5ByXG+QTosLLLL1FRPUFJ5eW+E4=;
        b=ZEuYk+kEoKcdkUb53O97oVu2QeC0DtzJ8DGhxGCw7/VmkAD95+mhVq8hLoPfLiZW/D
         0ntDIy8RQUMGs5cttwoEsWCEkQ4ImH0sFU6kYxWG/Qw6EKzKaQF75gPis64R9vbwNy+0
         81V57C3VXE3B49Z+DYcYuYZaTtkDxhfrBq1uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BLMaulvoKzFcRGTn5ByXG+QTosLLLL1FRPUFJ5eW+E4=;
        b=K7YvpuEBPWwZNABtfl2K8WB6BLlORYhPHCwp+6TjnQKo060L+lAqn/cKY/JB+iAjUy
         XzCiU4+NJSf8TU6hj8+g5KurfYkzN6DZmVAb+6V9ZtpDk1G3obfsmgz8RP8a0JrJgQV0
         /EGw0xUdcnH8NeACGBxv/YxRXpctcQMAtu1ZBJ7rK5hXbRgBkEMI8v3hRkO5JBJAPNhH
         EEL2MRLO+ES0KLLw0xUJ9Ih9SAqJY2S4zM3eleBTbdpTS8ol3Gapy2QFFPmuyP+WwuwM
         jUyP4AG9cPCigIyuSmsL+GmeXzFooKnNK+70X9qjqCOruAVTEwis5uFDbO2zf9D41B+Z
         VFzg==
X-Gm-Message-State: AOAM530UqE5GQTC7yFNkOV/MYSqPPRteSv+q4n7Uz2vtcPvuLTtzHpJF
	hXNqpgvIbIQOR0SC+YVRfHUZjah66FbItVWC
X-Google-Smtp-Source: ABdhPJxP9HRKx0CLU3Dx5uo2Dcxe14Jk8Lrc/oDBF7rWgAnSF6uq/vw0EkUC1SulbjKPaXvh8TdduQ==
X-Received: by 2002:ae9:ea18:: with SMTP id f24mr1813222qkg.135.1603803118119;
        Tue, 27 Oct 2020 05:51:58 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d129sm541806qkg.127.2020.10.27.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 05:51:57 -0700 (PDT)
Date: Tue, 27 Oct 2020 08:51:55 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, greg@kroah.com
Cc: users@linux.kernel.org
Subject: Re: [tools] b4 crash on staging driver patchset
Message-ID: <20201027125155.u7ttdwpdsz722rkw@chatter.i7.local>
References: <20201027122315.GA669512@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20201027122315.GA669512@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 27, 2020 at 01:23:15PM +0100, Greg KH wrote:
> Hi Konstantin,
> 
> On the latest tip of the 'b4' tree, I get the following crash with this
> patch series:
> 
> $ b4 am -t https://lore.kernel.org/r/20201019160604.1609180-1-Jerome.Pouiller@silabs.com

Ah, good find -- we need to fix the horrible base64 encoding legacy crud 
before we try to attest a message. There's a fix for it in the latest 
master.

Thanks!

-K

