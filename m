Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4596515C90
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 20:20:38 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id l15so10062522qtv.4
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k04NEc/gBVTgI9y1lxLlHsZmuglzXVvuneeA7P18WaQ=;
        b=C/nclxQrfIWTmYKD5Hg62TCoOfuj4olp/mObAqqIk7DIzkMnoY3OPvjy5l60v3uGzt
         NpE3a3ZGyaNOlPggxGNUO2zwE058P7715AU4+As60tqkqjuH5DmTHNwRfwo94BxW61Vq
         Ov/hpD0YsJ+nnaEUazqSJDQ2Xx2v6wjGkW5/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k04NEc/gBVTgI9y1lxLlHsZmuglzXVvuneeA7P18WaQ=;
        b=SM9eXoLFUoqj+yeMp5uFiDRCmlJRL2Gr32goYtMN+uLWFuY116ILDCEXJKYDAImFZN
         XYfGqVOpu7kEbZN1mwyFlgZCbxLYHULIPCE6uGOygTTFkx6I0mF/dZ4rtX1QYElzJr4j
         iZrIDCUJKRM6jIzXHuNOXYdDyJedwaawAIwF+vbVSqRZP0Yeat2Uaqb8XzPFdEOwTvvH
         e3dDP/Lbjf4BPYWeDgVKASdQnEZGw7hvAwthiZeGXA7+J20RKwC3krXmFo5jrekOaBgn
         j6BD+2YIlp5+z3v4sl9W/JoKEnCyckKA8xfP43ydt6BKPIS0ZNF2pD35ZyMZliwES6yL
         hVEA==
X-Gm-Message-State: ANoB5pkDcrZlJWVNq8q6YU5xo0giFPowQk9SjPYqJ0pp2g7Xup+b5hW2
	4ZYh6bme5Z2DOC++iNKqocEr0f3lYJ36wg==
X-Google-Smtp-Source: AA0mqf78Z2NOjl569OGc51iao6dw5JrVTat86vKXDGcxtIYjL3OedMu+FrqDO5qiCdIw9MkLbCIkLA==
X-Received: by 2002:ac8:4b55:0:b0:3a4:fcde:734b with SMTP id e21-20020ac84b55000000b003a4fcde734bmr23996663qts.238.1669148437103;
        Tue, 22 Nov 2022 12:20:37 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id j12-20020a05620a410c00b006eef13ef4c8sm11146467qko.94.2022.11.22.12.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 12:20:35 -0800 (PST)
Date: Tue, 22 Nov 2022 15:20:33 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221122202033.jeukag3i5pttqp5d@meerkat.local>
References: <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>

On Tue, Nov 22, 2022 at 09:10:40PM +0100, Noralf Trønnes wrote:
> > I'm guessing it's probably something python-requests handles behind the
> > scenes. What version is python3-requests for you?
> > 
> 
> $ apt show python3-requests
> Package: python3-requests
> Version: 2.25.1+dfsg-2

OK, this didn't get us closer to the culprit. :( This is the code that works
for me on Fedora 36, 37, RHEL 7, RHEL 8, and Ubuntu 20.04:

    #!/usr/bin/env python3
    import requests
    print('version: %s' % requests.__version__)
    jdata = {'foo': b'bar', 'action': 'test'}
    res = requests.post('https://lkml.kernel.org/_b4_submit', json=jdata)
    print(res.text)

E.g. on Ubuntu-20.04:

    mricon@i7:~$ lsb_release -ir
    Distributor ID: Ubuntu
    Release:        20.04
    mricon@i7:~$ python3 /tmp/testme.py
    version: 2.25.1
    Unknown action: test

However, I see that it's failing on Debian 11 with the JSON error.
I'll poke some more now that I have a test env and follow up.

-K
