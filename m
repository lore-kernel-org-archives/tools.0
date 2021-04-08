Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93470
	for <tools@linux.kernel.org>; Thu,  8 Apr 2021 16:18:36 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c6so1844744qtc.1
        for <tools@linux.kernel.org>; Thu, 08 Apr 2021 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=5p1PxlOUFfIBx0KTcOpDlu2vXFwby4PKllgzsYuPs7M=;
        b=TA3WfIjBpJUlyZJkSwmvIGU0iTlddJVV4YXgo9vo+Joe7zKdt/eijQMRpE4reTRCd1
         oUmb4FWx/o39P3BItuDdVacoxWwiEfr/2FDHCsqPcrvMozMKuamTjwN8X7n9BABIhWzB
         Rz7r4TVnOemXRpt+ISWHk5zR8J1sgedLMXD2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=5p1PxlOUFfIBx0KTcOpDlu2vXFwby4PKllgzsYuPs7M=;
        b=jMapLQtgKZYOJXL0Cil2QXO9Xf5xGW/wXr/KbmJT6J11FUC5Jf+wSFxTi0BsW3jwdq
         YG9rhwL/iEnPzCxAPZD0RBR8ABJh9Qo4UuKT5tRUjMBxjiuxsgsB8k38oQEX7/ow9XxK
         XkfM7l9yMShmSI93kpwdpXAJy7MzA9nQB/9AYc7D/aj4i/xSyHEjJPQfhJAtwum6NWZ9
         ud2IKZ7Gq+plpuaeLhdWvxyy57+KX8T4Jkt38Nw6FwDjp27J4kayAKr+MPHHU2+VR9hL
         4zYp7w/CPnyhOU+cFHnUjYsjXNmfrRHpL0UAtCiTmzPiEYpYkZvizBxCSG1GD/HKejy1
         xXqQ==
X-Gm-Message-State: AOAM533g4q8bS3/1hi/+Cx1UwDdt3vzT50wldy+vnwCNAl0l05hAQ+N/
	5o7Zfg0g8m6i9AXUd145NmcpCQ==
X-Google-Smtp-Source: ABdhPJykWUVXpiF32UCG5gEIi4cqEruQfuOiuPr33WVEoaX67Z05Vg4azwQs03qFI2c26JNc/+2Log==
X-Received: by 2002:a05:622a:134f:: with SMTP id w15mr8055868qtk.162.1617898715507;
        Thu, 08 Apr 2021 09:18:35 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id a28sm130526qtd.7.2021.04.08.09.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:18:35 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:18:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 corrupts patch
Message-ID: <20210408161833.icwv2ncdm37dvzbs@nitro.local>
Mail-Followup-To: Bjorn Helgaas <helgaas@kernel.org>,
	tools@linux.kernel.org
References: <20210408160226.GA1932146@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210408160226.GA1932146@bjorn-Precision-5520>

On Thu, Apr 08, 2021 at 11:02:26AM -0500, Bjorn Helgaas wrote:
> b4 seems to corrupt this patch when fetching and adding a Reviewed-by
> tag:
> 
>   https://lore.kernel.org/r/b411af88-5049-a1c6-83ac-d104a1f429be@huawei.com

Hmm... this is because the trailers are separated from the basement using '--'
and not '---'. Git gets confused, too, as if you apply the patch, you will get
this at the bottom of your commit message.

    --
    v2: rewrite subject and commit log as suggested by Bjorn Helgaas.

b4 messes things up a bit more because we mis-recognize that line as a trailer
and move "--" above the rest of the trailers (at least "git mailinfo" breaks
it up that way).

I'm not sure if I should fix this or not, as this is not a well-formed patch
to begin with.

Suggestions?

-K
