Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7163A3FC9
	for <tools@linux.kernel.org>; Sat,  2 Oct 2021 00:12:35 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so10512772pjw.0
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 17:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hAEp0Ef5lRzl/4rNbHSCfFN3P8dEioQ8uD3gBmY+Y0s=;
        b=X6P+znt6jTmn0/FRrHPmigsE6m5XIIkrQxuWXjtL5i1smxw1xHdY/dsgZATpUPzJrG
         p9BXLgIdaecQPLv+8lGwhGpC2MX2T/El6t0u75l1GCPeyC3mfBTcgYGJ9Qy6X8UmU0Kk
         w7gPNzsMWXlM8UICAGezRVk0ArsutZ2dKZ8Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hAEp0Ef5lRzl/4rNbHSCfFN3P8dEioQ8uD3gBmY+Y0s=;
        b=RC++RfweohCrSCxzfbIBPxyolWWq8MsIDnigsNEsp/LIZNAmhzEtohLYiboPkt/vTp
         7Pod+F43GanPQBcioaDjiDV64EKyWUqws0BIcn0EUoeu1H9jUcqat/PO8oIP+8PU9Ztk
         jzyVtiUzvVVyiHxRWNpCg0gyplFP/rtncwrxthcHXKI6FonapUwwpMV207ZJ5Om+wtdj
         b87FeHJZ/71Lpu4IaMwJ8aZcVbksQEd+dAZa+j/wT2nKXQgHivc1dEo3ZI/Hr/okOSmq
         e2F2bUsqgSslvK2E6+1eqR/Ic7vquuJO5XbxBt1B5Kx5ygmdvB6XrGc0cswXJPKMMkp9
         ZI0Q==
X-Gm-Message-State: AOAM533XlB/5vjH6uE5QixI5RVOxmpHSz2WU61KHDTNw3WBGtb3OQzYL
	5Oqq0tYZI3b7AYh/Ph8BCtYwNA==
X-Google-Smtp-Source: ABdhPJzlVXLqwZgdI9ub9oQtnz/bWHjCSqs+MbSYBLWS5gXQzzuqBnvj6WADb/XoEswo7Pvg+Lldeg==
X-Received: by 2002:a17:902:6ac7:b0:13e:1fec:2bbc with SMTP id i7-20020a1709026ac700b0013e1fec2bbcmr12126015plt.82.1633133555086;
        Fri, 01 Oct 2021 17:12:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k5sm8304054pfc.111.2021.10.01.17.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:12:34 -0700 (PDT)
Date: Fri, 1 Oct 2021 17:12:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Olof Johansson <olof@lixom.net>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <202110011712.ED93BE5@keescook>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <CAOesGMhQBQ0V5GmempB8UhtmAS3gokHb3ACiAiUgQeswwzQPmQ@mail.gmail.com>
 <202109301644.0DC921248@keescook>
 <CAOesGMj9PW1wex=y8VhPOJms8Xzp=J46Yx0_BxBkTdF+YE0NGA@mail.gmail.com>
 <20211001130501.5adf671e@oasis.local.home>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001130501.5adf671e@oasis.local.home>

On Fri, Oct 01, 2021 at 01:05:01PM -0400, Steven Rostedt wrote:
> On Thu, 30 Sep 2021 17:27:40 -0700
> Olof Johansson <olof@lixom.net> wrote:
> 
> > > Sure! How much of it could be replaced by b4, I wonder?  
> > 
> > I'll be honest, b4 is newer than all of this and I have had zero
> > cycles to invest in replacing anything with it. Maybe a lot of
> > overlap, and maybe all my work is redundant. I don't know.
> 
> Sounds like I'm very much in the same boat as Olof.

I just keep ripping big chunks out of my scripts and replacing them with
b4 one-liners. It's worth it. :)

-- 
Kees Cook
