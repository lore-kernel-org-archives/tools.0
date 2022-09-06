Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6786F5;
	Tue,  6 Sep 2022 21:55:46 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d12so12603261plr.6;
        Tue, 06 Sep 2022 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=08A9ZY/MJBxmhW0g36GPhYT0mmmu4ZYzB0aqlltGmXs=;
        b=Lhcov3tUAKXFRXAGzPjEIG4Hd2/uv8seV6RCACI5wElKRaqJS3jrd6uvWWXlH+ekWh
         aPm/KUVALoWk91/IgFYUd0YqgfybE1wcfKvEXOJMpYg46ChGzqwgSR5jrl/VRi/W72Mm
         cHy+VYgSAJR6UUu8ds+Qz9s6+6lkFmV7frb4WWCppS6DMMHFDiRjEyUvi/HXeDNpqumW
         AESNUw51PS0QliK611bh8X75O9lka/YbruFeKQyKgXynhPqrmz18Cxll9mYNywMVjmzK
         Fom3j06R8YlZxt8ppmeLOpRgueCew0RazgN03rxxuhW8zIZLevwmwAKbvcOo8Kh9Xvsi
         7jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=08A9ZY/MJBxmhW0g36GPhYT0mmmu4ZYzB0aqlltGmXs=;
        b=Q9OmfUCVL2wRHerMBioQSKhPFUgwxy0SeukGWv4Y+bzzV94CoDzrVYX2epKHdr/Jr0
         hKZG5TYzfN81D0bTYwCPSeKwa2iHg3Uv5jMlJ9+LKoIn5UeiiJJ6eo3qS1a5X70qjqVa
         Ry3aGzKY8qVD2RBCWV18e+zP/km0WOxLRBB7gOBWA+Va1XXe5wBtuH90qh8otjAfiEZr
         ux58sscX4ZmidrCvKk0XiYGVFd2Fv3TtIyP1YWuVXsGRC9Cu2KBHtz8IaGw7aeTvmvhd
         z0I8X/Pbs4g6T6WgACSe+KtZ95iXZsZ2C3NdXiijj118/sq7RErNiEprkQfyQxm2Y44I
         vUBg==
X-Gm-Message-State: ACgBeo1OiM79ApV7I7Ie2Zy26xIPreJzcRuCLVlbl5hpeNV/fG98cTEo
	XdPGg+DsRAOLGrO+kIOs168=
X-Google-Smtp-Source: AA6agR7C0NpeSSFI3Ckn6IAtd/QZKkQKN37yGL4L/Y/lRhNwtVKG4YX7fXQfBW0s1lhAVZgZsoKaZA==
X-Received: by 2002:a17:903:2349:b0:174:cef1:69ad with SMTP id c9-20020a170903234900b00174cef169admr351731plh.138.1662501345948;
        Tue, 06 Sep 2022 14:55:45 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:abc4:5d24:5a73:a96b])
        by smtp.gmail.com with ESMTPSA id p5-20020aa79e85000000b0053826eaa1c7sm10740581pfq.22.2022.09.06.14.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 14:55:45 -0700 (PDT)
Date: Tue, 6 Sep 2022 14:55:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 prep/b4 send feature request
Message-ID: <YxfB3yWg7Jnz4IrO@google.com>
References: <Yxecq5DHE5oW0XJD@google.com>
 <20220906212939.7numvfo6ceenwtfy@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906212939.7numvfo6ceenwtfy@meerkat.local>

On Tue, Sep 06, 2022 at 05:29:39PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 06, 2022 at 12:16:59PM -0700, Dmitry Torokhov wrote:
> > Hi Konstantin,
> > 
> > Not sure if you are taking feature requests, but it would be great if
> > the magic that happens after sending patches via "b4 send" could happen
> > on demand.
> > 
> > The reason is I am using OAuth2 when authenticating to Gmail to
> > send/receive mail, and b4 does not support it, so I tried using "b4 send
> > -o ..." followed by "git send-email ..." (and I was able to set up git
> > send-email to work with OAuth2 tokens), but in this case the magic does
> > not happen.
> 
> Yes, this sounds reasonable -- I will add that in.

Awesome, thank you!

-- 
Dmitry
