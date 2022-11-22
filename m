Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9537F1229D
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 19:44:31 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 8so11058239qka.1
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 11:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0+HgcccZzB9zt4IfNYL9eXT1kWO7K5B4j8UcO6yi+s=;
        b=gUkwmDGOxCveHpT77uJhcSSZ234MqnhPpwealH4GjwXukbkfvWVmaHyrDxj8318Bbj
         0qJgSdARo6fpXx/MbbBEmcuiXJl1nUGCDUI3PpH+OExxAYESYhjsNWp3l0PT1we7+RPJ
         CYC5q8J3iiOnlfzndfEbWVIknKiE2C9lDl4ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0+HgcccZzB9zt4IfNYL9eXT1kWO7K5B4j8UcO6yi+s=;
        b=A9ntgzxefNHSS23ABkaIfDNA5BpJMlOhzYJSk0YJtNxMObj5cy5O44Tm7od/XNIoM4
         zdkLWQNmjalWxisZDfMROuht59RnQru9slPbXQpGsWqOlJvDdbVPoifolM5QNDe+JmZ2
         KTnP50ttQQkdoevcgLaiIfV8JT3CRRLxde504+Bh9CvIKm8xyF0POtDxUaBzCWV5tSFr
         VuoMWRTT/Hra3ANUPxnLtXA6Tw+XJM7HrkffDknvaqdr3ng4pqzqs9wjjdldMcIFWaSK
         C2VhbX1x8rOc6+TDhOgUnMhou0Jd1X26prx8c6z3M/rgfhM8sPlO1iWN736JCjj8XMnl
         E9NA==
X-Gm-Message-State: ANoB5pntP0d2pW0q4joSyvWaaTSlNpNyD5XNFxalKNTB2xzHsr3BFTcs
	fAFqrmz3uhs7xFdlsBkjmkLJ7CVF4/56fA==
X-Google-Smtp-Source: AA0mqf7Cz2PacJSUaSJ0h+8ssE17Wa1FLt2t+I9jRQZvQgyjEn8b7g6L8Mgpl3D1RnnKbLi8oIe0wg==
X-Received: by 2002:a37:e20b:0:b0:6fa:3710:ba6e with SMTP id g11-20020a37e20b000000b006fa3710ba6emr6733816qki.164.1669146270389;
        Tue, 22 Nov 2022 11:44:30 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id q24-20020a37f718000000b006ed61f18651sm10338951qkj.16.2022.11.22.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 11:44:30 -0800 (PST)
Date: Tue, 22 Nov 2022 14:44:28 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Error using b4 web endpoint (was Re: git send-email friendly smtp
 provider anyone?)
Message-ID: <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>

(Dropping everyone from cc's and adding the tools list.)

On Tue, Nov 22, 2022 at 08:22:22PM +0100, Noralf Trønnes wrote:
> > Yes. There will be a 0.10.2 in the near future, but the incoming fixes
> > shouldn't make much difference for the b4 send code.
> > 
> 
> This is what I got:
> 
> $ b4 send --web-auth-verify <challenge string from email>
> Signing challenge
> Submitting verification to https://lkml.kernel.org/_b4_submit
> Traceback (most recent call last):
>   File "/home/pi/.local/lib/python3.10/site-packages/b4/ez.py", line 188, in auth_verify
>     res = ses.post(endpoint, json=req)
> ...
> TypeError: Object of type bytes is not JSON serializable

This is very strange, because this is literally the code in question:

    req = {
        'action': 'auth-verify',
        'msg': bdata.encode(),
    }
    logger.info('Submitting verification to %s', endpoint)
    ses = b4.get_requests_session()
    res = ses.post(endpoint, json=req)

I don't see where "Object of type bytes" would come from. Can you possibly
insert the following above the `res = ses.post` line:

    logger.debug('endpoint=%s, req=%s', endpoint, req)

Regards,
-K
