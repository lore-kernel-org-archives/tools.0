Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.11876.1584740738176438532
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 14:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NxGy5gT9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id v11so9240198wrm.9
        for <tools@linux.kernel.org>; Fri, 20 Mar 2020 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=v5aUMPAnZaG/8EMiKnneSei7QMQtZSyFtHzoJCcq5VI=;
        b=NxGy5gT9uLzyHJ6Qm5+oV5AYG1mBKo5eL7I9Ts2XMaAYmnE5PiKl6WxbD+Vup51gA+
         8a0RESPmLyA1rr7uj1ZEUrcIs78yH1tTBBXubrSkhhUgaUHYdjkdL4ostE/z53t8H0OZ
         l9RNgzW9HfQADFnCzTpcDwny6YEN0xj46T/Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=v5aUMPAnZaG/8EMiKnneSei7QMQtZSyFtHzoJCcq5VI=;
        b=j/tjDsxdB+xC0OYrfo6o1gOpyMKdeR+FToh7estivY9mW6p1c2O2Bd2s+TKUPBBFkn
         gPbEWfsEJqtDLMn1myuijPDjFahrxhDs01xnT3FcknGUZ62ZWsObFHLJcaWdyRTTGNks
         cPOaVUa768PVcxGdmXbvwYuJF7KMml2j+8RKgyFoGxVTHmjyGrpNBi9LcVWTDb4GZCzd
         Wle/rFNmbH+GjPrGhMsH2wZK0cbddb2tWLC/Pvk1bIJkiCkYIP3t524aWaGfH6qXfpdH
         Dd93k3d0kDC+qwvn7ct94nl0Ypji039Dsqzf8j3s+kvDGWisBLNoKd0pUeQe4NuaEP7E
         PT+w==
X-Gm-Message-State: ANhLgQ3FQOhJ5XbjLKgv3hDeh2VTU0f4v3nRTgbzS6/OZokOQInBf3BZ
	761dOTDh0yKocuJPGAXVtitTIA==
X-Google-Smtp-Source: ADFU+vvsGceigRQe4bszb72fiQVkT6PzQfqeZ+MZ7YNRyG2cKVYTb4CEU2VYn7f7wN6aZwjuiKz4rQ==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr13695881wro.68.1584740736569;
        Fri, 20 Mar 2020 14:45:36 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([85.248.227.165])
        by smtp.gmail.com with ESMTPSA id n63sm6562197wmf.6.2020.03.20.14.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 14:45:35 -0700 (PDT)
Date: Fri, 20 Mar 2020 17:45:32 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: B4 and gmail integration features
Message-ID: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

For my next B4 trick, I plan to add some basic gmail integration -- 
since I know many of you do use gmail.

By default it will do nothing, of course, but if Gmail API is enabled 
and we find a successful authorization token, we can automatically do 
the following:

1. Grab threads from your gmail account in order to backfill any missing 
   messages that aren't on lore.kernel.org for some reason
2. After "b4 am", add an "Applied" label to any matching messages in 
   your inbox
3. Optionally, also send a "thanks, applied" templated reply after you 
   do "b4 am"

(#3 will also be available if we find a sendemail.smtpserver.)

Is that useful? Anything else I should be looking at?

-K
