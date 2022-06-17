Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA633EC
	for <tools@linux.kernel.org>; Fri, 17 Jun 2022 19:01:56 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id d23so3812763qke.0
        for <tools@linux.kernel.org>; Fri, 17 Jun 2022 12:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=t2OPGw4mM2Rc3SULvTq20VShDb0+8h5DxZlqYhO0UJU=;
        b=SX7sAvtH5Qms85Z0U+uwTmCiRs4YSKe85hUSh888OFTUaS/zvAk5QsAAQqs/Ilbri6
         m1HwF2X+lL/wJhgXBZZ+T/nTH2o5WOp2jM/9XhQWtmEUjb7NSGWIKeHaWVToEghhupsT
         D0qqeNgpM23FCFSMAmeWW7esA1pW0SjurITro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=t2OPGw4mM2Rc3SULvTq20VShDb0+8h5DxZlqYhO0UJU=;
        b=DA6s/ygrokaKc7nguuhpHsp9NSUlzEnR1bxhcTmpTqAVdOZvaMXTVQko572kuVtF9v
         gNj+TGGT3rXjZhUrqnFfmxHnTM3G0fXrLr118IYYzyhFZtcr8q65dfosY8q/iQxfxllH
         KZjoAcwaT+jFll3ftj5SXHIL3kuFwjJNvSa4kZrjWtjRJnyTxKVhYkBYLQymveZvTs1+
         AmBFpQ23CxG96M3pCJK+Rbgh5brJ6OoxzspaxgrV+oQfsealieK008SYCfVuHHwZt1M1
         AbcfDH/2vMal+XkT+4O8t5VSVbVH6OXdU6PeaDmGkRcStwdmay2Lil7cP506GH0+SR/y
         q9uQ==
X-Gm-Message-State: AJIora9E21IusKHtSWrhLFv/na8y8TPKGXscDWErZDSObGs8D2oGVwfx
	PJM6AeilVJzLSMPwOlHFGr+WSYnHt1h2hQ==
X-Google-Smtp-Source: AGRyM1tX5tpFHqQyxjb/O20aO72bczZbCy4+C0tsezsd7Gw+c01lgFPBulHLuDRWjwEWtay29pNGlA==
X-Received: by 2002:a05:620a:4726:b0:6a6:d207:7a3f with SMTP id bs38-20020a05620a472600b006a6d2077a3fmr8326767qkb.239.1655492515635;
        Fri, 17 Jun 2022 12:01:55 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id v1-20020a05620a0f0100b006a787380a5csm5301523qkl.67.2022.06.17.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:01:55 -0700 (PDT)
Date: Fri, 17 Jun 2022 15:01:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4-0.9.0 available
Message-ID: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aqkjv46cwpxjqkr6"
Content-Disposition: inline


--aqkjv46cwpxjqkr6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

After a bit of a hiatus, I am finally able to work on b4 again, so here's
version 0.9.0 that implements one major new feature and adds some other
improvements to existing features.

# new: b4 shazam

This command is very similar to "b4 am", but it allows you to apply patches
directly to the git repository without the need pipe the output of "b4 am" to
"git am".

The shazam command has three modes of operation:

1. default mode that applies patches directly to your git repository, just
   like passing the .mbox file to git-am
2. with -H, shazam will try to prepare the patch series into FETCH_HEAD, which
   can then be checked out into a branch or merged with git-merge. This
   effectively makes patch series work similar to pull requests.
3. with -M, shazam will do the same as with -H, but will also exec git-merge
   with the cover letter prepared as part of the merge commit message. You can
   see it in action here: https://asciinema.org/a/502421

Please trial it out and report any problems or improvements you would like to
see.

# improved: --no-parent mode for b4 am/shazam

Per popular request, you are now able to break threads at the message-id
specified using the --no-parent flag to am/shazam subcommands. In this case,
b4 should ignore any parent messages in the thread and only operate on the
message itself and any of its descendants. This should help unconfuse b4 when
someone submits an auxiliary patch in the middle of a thread and you want to
be able to get *just* that patch and not the parent series.

# improved: send mail with b4 ty -S

If you're using b4 ty, you can use the -S switch to have b4 send mail directly
instead of just writing .thanks files. Additionally, b4 ty gained --dry-run to
help make sure that things are looking good before you actually send mail.

# improved: mailmap support for b4 ty

If you're using b4 ty, it will now properly check the .mailmap file when
creating reply messages. You can also exclude entire domains from ever being
included in to/cc when generating thank-you replies using the email-exclude
setting, e.g.:

    [b4]
        email-exclude = *@codeaurora.org

In addition to the above, there are fixes and improvements to many aspects of
b4.

# Upgrading

To upgrade from pip, run:

    pip install --upgrade b4

Alternatively, wait for distros to pick up the new release.

If you want to run b4 from your git checkout, check the README that documents
this option.

# Thanks

Thank you for your patience while I was unable to dedicate a lot of time to
b4. I had to spend a lot of time migrating and upgrading hardware at LF, and
then a certain dictator started a bloody invasion in Ukraine, which
significantly affected my ability to concentrate on most other things. If you
can, please support Ukraine's fight against the invading fascist regime
through your preferred humanitarian org.

I would also like to thank the following people who helped with this release,
in the reverse git log order:

- David Vernet <void@manifault.com>
- Mark Brown <broonie@kernel.org>
- Rob Herring <robh@kernel.org>
- Jens Axboe <axboe@kernel.dk>
- Kees Cook <keescook@chromium.org>

Best regards,
Konstantin

--aqkjv46cwpxjqkr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYqzPoQAKCRC2xBzjVmSZ
bLJiAP4jfWEuwvUuSrelQVc18dLzj4fB5XV4R+3Bx9U2ykn50QD8DGGzSIh/XgMB
CvKKRxxsvQQpxVh4GIHXWWLAgBZnpQE=
=MMkA
-----END PGP SIGNATURE-----

--aqkjv46cwpxjqkr6--
