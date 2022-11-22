Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62103222
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 18:52:52 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id e15so10703660qvo.4
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0jn5wlFf+6myIUgyXb61vwy/GJptvYgsTn9XmUMLCQU=;
        b=ML6JipVAeKHqfxNP3xy/Oe8SKw8GAUFuTd904iS7HKg/kKiErqHhy/d5g2txhpjyij
         sJ5gJMa0UlOKsjYjpqre9xdu6lZ0/5L4azxuO7CVLQaVwOLHQ2WtHvcIkbs0JwH7Bt6W
         C8PrlI2kOnB4xxviRPdzpkGr981eGv+qwSee4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jn5wlFf+6myIUgyXb61vwy/GJptvYgsTn9XmUMLCQU=;
        b=srhuLgCWJTjrOIlsPT9FuTn7y0AJ5ftPogeNoyrgvKTpnlp80lZfSTzhbTFhm45NfX
         gzXX6HP07SJUMWbGhTrJ3zvBv2f2iw+YGDJUJTPuWiztXJ21BW6g0/7JwEau8Yys9K8f
         JUuhAIL1sJVijR/N8SIJbTc2dGrnKz53OetV1XCV59n0Kkpssg9rMNLEFFIPIV1j3bBb
         LUlr0Is7p9vR2gemhW5zx4z+EyqvPrJ7ECxwCVyPeJ5iyjDhV+C49CaQtJzkz/v3u+93
         qIprzIwUzCavqyLgSlqedW2szEOs7mCpx0H2Zcfw/JOcLC1xZkV8JOKMjqYocjutEfJf
         IUcA==
X-Gm-Message-State: ANoB5pke9hneJnmDRtfIJW9r7fWc4/SCOtef6jOJ01cLjEofO7JLDiME
	urZrnufuKdiHKMuHy9dmbmzb4YfypTkXEA==
X-Google-Smtp-Source: AA0mqf5CyM5QkCQQrKXGVu+oVmOz/XYYMbeInn4yOyFmRpY9Q4Q4cLymZzIL8WsqCzZHbAsZexzwNQ==
X-Received: by 2002:a05:6214:1850:b0:4bb:6b68:9ab6 with SMTP id d16-20020a056214185000b004bb6b689ab6mr11103102qvy.128.1669143171386;
        Tue, 22 Nov 2022 10:52:51 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bl6-20020a05620a1a8600b006ce9e880c6fsm10637434qkb.111.2022.11.22.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 10:52:50 -0800 (PST)
Date: Tue, 22 Nov 2022 13:52:49 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Preserving notes when updating trailers
Message-ID: <20221122185249.733ipcpwpgkh5xle@meerkat.local>
References: <20220929074717.u2xfvfwq4ki732tw@wittgenstein>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220929074717.u2xfvfwq4ki732tw@wittgenstein>

On Thu, Sep 29, 2022 at 09:47:17AM +0200, Christian Brauner wrote:
> Hey Konstantin,
> 
> When updating trailers using b4 for a series git notes aren't preserved
> for the individual commit messages. I have a work around for this. After
> updating the trailers I can use filter-repo/commit_map which provides a
> list of the old and new hashes. Then each line can simply be fed to git
> notes copy. It'd be nice if b4 would be able do this natively e.g., by
> having a command line option to preserve notes.

After looking into this, I believe it's something that should be fixed in
git-filter-repo, not in b4. It's a known problem and there's a long-standing
github issue tracking it:
https://github.com/newren/git-filter-repo/issues/22

For now, it's just something that will have to be a "known problem."

-K
