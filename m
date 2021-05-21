Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06970
	for <tools@linux.kernel.org>; Fri, 21 May 2021 21:44:56 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id f18so21292470qko.7
        for <tools@linux.kernel.org>; Fri, 21 May 2021 14:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Eahm1JATjNGE99EXTgi6JcXXdxz1oW0lKGC9+uXIlr4=;
        b=EODfxyVlV7zXWUcDEzsYe/EqHgb8p+RcpSSipfc/55hfmr7sts8Wh0xg5kA+dlCAQl
         QN/wtAshlIDNJeByRw2lwn2KRgrUd8q+UWfI+hZj5+RQM99JpUei3YNFeAOztBm6t/se
         MCHq7xFbSsyM7TKlqWDmTtvUsDb+1BZPgd9nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Eahm1JATjNGE99EXTgi6JcXXdxz1oW0lKGC9+uXIlr4=;
        b=t3o48RlfE6+Wt5Xvez/XJDYWcFN4cylOPV0lvLPYoBOhWviq08ePcdnIeVlnEiRuDD
         fK5KbWR45NJg7qhinXAF6oZhkDfYUE0sJwp0Wb7BkOI5MN6ELDj0cpeSwDz7I85/CIa0
         k2pdZR9f5i8ahiNMHKs9v6PSevp5gHTrhGUOMbkV0cxIplc+RPogX/epPM6zXiKX5vWc
         DwY9ZkoRysek+Rt7gadLkv0OwgOSSRK2vvL6s5CYNPL2RTAmy2TlbxzHWDTJ/mmtissN
         2FAHu86gKVXCilnNAO+zCHje+JnmGOGLj2MwWaiTM8+dqRhxzJCVl7qbpWy220zNk9qu
         dLow==
X-Gm-Message-State: AOAM532fBY9WUgmRhEvDmGwvqSWHZNsAO6V/nX3eS9+x7tzrfE8AonKh
	SqH9HClNHvYHrwGYjBh5SXwYPgYxvH66eU21
X-Google-Smtp-Source: ABdhPJwxcaV2WucfQs4UzyyvOVfNH1lpfdS+hjMxQbV0yjza67ZVjzg38ZKAV0ceizQBKC8acU7VIA==
X-Received: by 2002:a37:38d:: with SMTP id 135mr15862295qkd.136.1621633495402;
        Fri, 21 May 2021 14:44:55 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d28sm5804132qkl.105.2021.05.21.14.44.54
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:44:55 -0700 (PDT)
Date: Fri, 21 May 2021 17:44:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4-0.7 release next week
Message-ID: <20210521214453.rsslslzjarpeovl3@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I will probably release b4-0.7.0 next week. The most notable change in it is a
(yet another) rewrite of patch attestation stuff, which mostly moved into its
own mini-library called "patatt". You can read about it in detail here:

    https://git.kernel.org/pub/scm/utils/patatt/patatt.git/about/

or see its pypi page:

    https://pypi.org/project/patatt/

I hope this will be the last reimplementation, but I am leaving attestation
features marked as "EXPERIMENTAL" for another release round, until 0.8 when it
will move into beta. I intend to write a longer piece about patch attestation
in the near future, so I won't go into too much detail here.

If you're currently using "b4 attest" you should be able to continue doing so,
granted that you install the patatt dependency. If you're using b4 from git,
run:

    git submodule update --init

If you are using b4 from pip, patatt will be pulled automatically in once 0.7
is out.

There's a few other notable changes:

- we've ditched Python's native "mbox" implementation since it's apparently
  incompatible with git's idea of "mbox" (see my mini-rant in this commit:
  https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=4950093c0c3 ). We
  will now write git-compatible mbox files, or you can pass -M to write out
  maildirs (this can be made permanent with b4.save-maildirs=yes). Maildirs
  are natively recognized by all git operations, so it's a perfectly good
  solution that avoids any possible mbox format ambiguities.

- b4 can now recognize partial rerolls, see example here:
  https://lore.kernel.org/tools/20210517161317.teawoh5qovxpmqdc@nitro.local/

- b4 will now accept mbox passed via stdin, so it's possible to pipe full 
  threads from mutt. See example here:
  https://lore.kernel.org/tools/20210517220151.b2bmt5f2jjlgmkos@nitro.local/

The master 0.7-dev branch should be stable enough at this point for day-to-day
operations, so if you're using b4 from a git checkout, you can switch to
master and give things a whirl. If you do, make sure you pull in the patatt
submodule via the command shown above.

If you find any regressions, please send them here.

Best regards,
-K
