Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.7619.1585060740749688172
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 07:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KPeSc0AL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id a9so3738505wmj.4
        for <tools@linux.kernel.org>; Tue, 24 Mar 2020 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=P6VC8VUwqMfTcLOTDDu7coaZIeHVGtzAj9w8WUzTN90=;
        b=KPeSc0AL7rnpQP1pk+h/IOb/+d64xthvybI2HDdIPUCWpkHpJBKy/xEAjwyj14Fm0y
         5MDPzKHBIvFhHEUpHWHfF5i8sQuGHu8gDjbia3IQtAhkpiWsXT75WjxkwLdTr9ftmvSE
         3WbW5PSbMkPuUrxmqmREeaQcflPPqnLvu9YIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=P6VC8VUwqMfTcLOTDDu7coaZIeHVGtzAj9w8WUzTN90=;
        b=ie2auAoggAbCKXm93JjFRUKpJRYgMsoU/aQPIOvvtG5i3DZ0zDp5Wm+RGS06rNF4JQ
         IojRzLzWj5XCw/IKPra/It2H4gG2YsHg7RBaX74lgd9gGvnEY2fIdPtUabF8qTSNRZmv
         Iyu/9PkEiMHBGK19h9cWl9r6O2W4thRRuRTU0FH4GrOFsU8Mt6VLsjYAjJYyO4vU3Zyf
         4EV5aJ5gDWf5iHZBfWWySIueEQg4yAqI/YxxMdov8m7auE2DrWtAGI00LA423qLWLaES
         mt0eJzuJAWzb8kCgefqWB474CHupKUZYzQTRcLMgbolv1nFoeQrS+QQcEpZWyQo0ymbj
         8CFw==
X-Gm-Message-State: ANhLgQ35FLeHHiMZMZweV5CVH7LnoOX21DsA2UH3bIJXo11wDYMYZyVx
	UEoCQEDsoZOKWcoSIaQW3a8RzH4tX9E3gTc4
X-Google-Smtp-Source: ADFU+vtjkC5VugEqc14ryVjgIvBVQBKseVbTHPQ7gxGUfVykbey6487vdpb34ph+z0F9Y1q5nnHHYw==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr3619611wmo.138.1585060739102;
        Tue, 24 Mar 2020 07:38:59 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([51.158.111.157])
        by smtp.gmail.com with ESMTPSA id q3sm18260191wru.87.2020.03.24.07.38.57
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 07:38:58 -0700 (PDT)
Date: Tue, 24 Mar 2020 10:38:55 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: stable-0.3.y branch created
Message-ID: <20200324143855.njudzgvb2niehpue@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

If you're using b4 from a checkout, you may want to switch to the 
stable-0.3.y branch, as master may get a bit buggy as I work on 
gmail/localmail integration.

-K
