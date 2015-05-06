//
//  ItemMenu.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "ItemMenu.h"
#import "Segment.h"

@implementation ItemMenu

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        [[NSBundle mainBundle] loadNibNamed:@"ItemMenu" owner:self options:nil];
        
        self.bounds = self.view.frame;
        
        [self loadNibFile];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        
        [[NSBundle mainBundle] loadNibNamed:@"ItemMenu" owner:self options:nil];
        
        [self loadNibFile];
    }
    
    return self;
}

-(void) loadNibFile{
    
    self.backgroundColor = self.view.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    
    [self addSubview:self.view];
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    self.segmentsMenu = [[NSMutableArray alloc] init];
    
    self.amountSegments = [self.segmentsTitles count];
    
    if(self.amountSegments == 1){
        self.separationSize = 0.0;
    }
    
    //Draw Segments
    for (int i = 0; i < self.amountSegments; i++) {
        
        
        Segment *newSegment = [[Segment alloc] init];
        [newSegment setFrame:[newSegment getSegmentRectBasedOnFrameContainer:rect]];

        CGFloat startAngle = 360 / self.amountSegments;
        
        newSegment.endAngle = (startAngle + (startAngle * (i-1)) +self.separationSize);
        newSegment.startAngle = (startAngle + (startAngle * i)) - self.separationSize;
        newSegment.idSegment = i;
        
        if (i == 0) {
            newSegment.endAngle = self.separationSize;
            newSegment.startAngle = startAngle - self.separationSize;
            newSegment.isSelected = YES;
        }
        
        newSegment.backgroundColor = [UIColor clearColor];
        newSegment.segmentTitle = [self.segmentsTitles[i] uppercaseString];
        
        [self.segmentsMenu addObject:newSegment];
        
        [self.view addSubview:newSegment];
    }
    
    //Draw Circle
    self.newone = [[Circle alloc] init];
    [self.newone setFrame:[self.newone getCircleRectBasedOnFrameContainer:rect]];
    
    self.newone.backgroundColor = [UIColor clearColor];
    self.newone.fillColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:self.newone];
    
    //Draw Title
    self.segmentTitle = [[Title alloc] initWithFrame:self.newone.frame];
    self.segmentTitle.text = [self.segmentsTitles.firstObject uppercaseString];
    
    
    [self.view addSubview:self.segmentTitle];
    
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super beginTrackingWithTouch:touch withEvent:event];
    
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];

    [self.segmentsMenu enumerateObjectsUsingBlock:^(Segment *segmentSelectd, NSUInteger idx, BOOL *stop) {

        if(segmentSelectd.isSelected){
            
            NSInteger currentIDSegmentSelected = segmentSelectd.idSegment;
            NSInteger nextIDSegment = 0;
            
            
            if (currentIDSegmentSelected < ([self.segmentsMenu count] - 1)) {
                nextIDSegment = currentIDSegmentSelected + 1;
            }
            
            segmentSelectd.isSelected = NO;
            [segmentSelectd setNeedsDisplay];
            
            segmentSelectd = self.segmentsMenu[nextIDSegment];
            segmentSelectd.isSelected = YES;
            [segmentSelectd setNeedsDisplay];
            
            self.segmentTitle.text = segmentSelectd.segmentTitle;

            
            *stop = YES;
            return;
        }

    }];
    
    //We need to track continuously
    return YES;
}


-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super endTrackingWithTouch:touch withEvent:event];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    
    [super touchesBegan:touches withEvent:event];
    // Get the only touch (multipleTouchEnabled is NO)
    UITouch* touch = [touches anyObject];
    

    
    // Track the touch
    [self beginTrackingWithTouch:touch withEvent:event];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    UITouch* touch = [touches anyObject];
    // Track the touch
    [self endTrackingWithTouch:touch withEvent:event];
}


@end
