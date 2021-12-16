Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BE168
	for <tools@linux.kernel.org>; Thu, 16 Dec 2021 20:24:02 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id t83so103607qke.8
        for <tools@linux.kernel.org>; Thu, 16 Dec 2021 12:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XHjTKjqjZbLcJC68LVcU5/+1jNM1W7v8Hvs5ufrohYY=;
        b=DL92xnQcRXQQQJ8SKGUKVDEJZeicYytqtiian2v0SQBWERaZMyalubFEUZqOTVSyjh
         rv1UMw+W/Alstl6iCXoLp7G7HAE732z2p6yThe2fzTHf45mEgMXTGex3aZkGEFP/Ea+f
         JU3JbDR3BumFsruQbzGv6W+d3JqPGXX3h7bg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHjTKjqjZbLcJC68LVcU5/+1jNM1W7v8Hvs5ufrohYY=;
        b=txMdjvUxBTSb2HuR8yorq+AgvcCLv4ClYkqIwf6jaaFncvrhXVURLHhzZ4IzWlqZuo
         y4SuJs7LGS8EdvKlXMGZZv0nCBCmA65mwChE1myy9ZErUrULt0Qrr25V++Xc5isLlIeR
         zAEhHGDMmqznw6uWDkrJpd9U/+kuYBXnQW1yIQnUxHGqWl9NG8n7RSrasnhNilkj85Jz
         90HLSDZglOa5WsYsKk2OJz2pHvbzull8wjvs///+YhjPuEo5OKUh59XetiOlEhOAHAYU
         XU8hnJtKSqECjmdB8fqYc+18rVOu22pTwhsdNFMq1HEaIK+RKxRJIkgpSOexStGJzBj0
         jMLw==
X-Gm-Message-State: AOAM533zaTZmMgeVW+9+15OMSAoZep/84EExrICxe16vV7lguGStX19Y
	mNHMRrMUfCQkSX4wHFbbCVDBfR6SIlHfeykKVyf9Sw==
X-Google-Smtp-Source: ABdhPJzxWnfW8pAgc5BBDDFNUpy6vzBTNIU95MAF25kojcNp5YZF+OLEWebOmDMDEYZuEY/WU1dSCj3ln1h9UJo1TGs=
X-Received: by 2002:a37:7c8:: with SMTP id 191mr13538675qkh.54.1639686241430;
 Thu, 16 Dec 2021 12:24:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20211202233836.2024510-1-keescook@chromium.org> <163943460494.66209.9818066449080666174.b4-ty@linuxfoundation.org>
In-Reply-To: <163943460494.66209.9818066449080666174.b4-ty@linuxfoundation.org>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Thu, 16 Dec 2021 15:23:50 -0500
Message-ID: <CAMwyc-T-cGB1Fj-i9ZTmCcnnF929uESkVkKeKmPBF_DKmjTsuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] patchwork-bot: Ignore empty context lines
To: Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Dec 2021 at 17:30, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> [1/2] patchwork-bot: Ignore empty context lines
>       commit: 8998144862b16cfa7a2ec07757d43ca269d59373

Sorry, I had to revert this, as it was causing patchwork hash
mismatches. We want to be fully identical with upstream patchwork in
this function, since otherwise it results in different hashes
generated for identical patches.

Regards,
-K
