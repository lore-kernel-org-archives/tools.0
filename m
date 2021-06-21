Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4679772
	for <tools@linux.kernel.org>; Mon, 21 Jun 2021 20:03:00 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id q190so30989167qkd.2
        for <tools@linux.kernel.org>; Mon, 21 Jun 2021 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/6bAdqgzL79TQExQ6FbQlREw4rVjgoRdr85qq1hilAw=;
        b=TRGw+QTm8OFynlPA38voN6yFvCzqSXyWqmB7Uak8peLiz2VoPOJFTZz0MlG/EzZ8g1
         k4L76WPtGv4W047b2ZICHqhReUZvX+XkjAHAJXipWcKaexwBnZH25U1eQCc5onEBYJ30
         4Jf8GCRmrnV4htoIcUba//bspQPYe8jgpg53E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/6bAdqgzL79TQExQ6FbQlREw4rVjgoRdr85qq1hilAw=;
        b=oKPT7py9zdfzZ/6WULjYxglqFdheVcfjAZ9l6SUF26RwgHCgWqjSUgq307QCWXL7OE
         TdMZJRSjrCjGQO7keIuxYrsT5pl+rdN+CKtrk9t8oYVuWPuFiUvY7/WBZYIXkKcBW2LJ
         imiQMHQ+Zfv8ORwEkEB7qbvYATVk6oOWmrwrec+gd+/cqiSS8MUt4mMalDNArGoaKtMf
         lmTTrW8auSt8Q73vOhK9gi3D+mqAofRtKh7M9agCAy6UQ/+oaCtDJTfxOBUczB5PnAgv
         A4lnF9Vo4CIBcJOA9IXwzODj21H29RTZohDEUQcN7AYz3S+5yFJZoHHN2VkwV7xpvl6f
         77yw==
X-Gm-Message-State: AOAM5314dkbCaJRu2a27wq9f5VWej2Mh20RvDg8lbc8yrbFEv4KhFsI/
	MAMiOhvr8zb0qWY8GRieipekYg==
X-Google-Smtp-Source: ABdhPJzNNLVFtjnJIwlZMFygURuFxKIhZoTLJI6YrEaY+zfScuoZbAjzDp7j/enZraLKXBruMY8cEA==
X-Received: by 2002:a37:a58b:: with SMTP id o133mr371240qke.418.1624305779029;
        Mon, 21 Jun 2021 13:02:59 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t187sm10635971qkc.56.2021.06.21.13.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 13:02:58 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:02:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 1/2] check_applies_clean: Don't append '.git' repeatedly
Message-ID: <20210621200257.4agqa23xda3z5qd4@nitro.local>
References: <20210618182452.2577871-1-robh@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618182452.2577871-1-robh@kernel.org>

On Fri, Jun 18, 2021 at 12:24:51PM -0600, Rob Herring wrote:
> In check_applies_clean, each iteration of the file loop in appends '.git'
> to 'gitdir' again which is obviously wrong.

There was already a fix for this in master and stable-0.7.y.

-K
